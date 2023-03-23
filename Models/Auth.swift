import SwiftUI
import CryptoKit
import Foundation

let affectNumber = Int.random(in: Int.min...Int.max)
struct ApiResponse: Codable {
    let status: Int
    let timeStamp: Int64
    let apiVersion: String
    let serviceState: String
    let sosan: String
}

func getBasicNumber(from data: Data) -> Int? {
    do {
        let jsonResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
        if let sosanInt = Int(jsonResponse.sosan) {
            return sosanInt
        } else {
            print("Error: sosan cannot be converted to Int")
        }
    } catch {
        print("Error decoding sosan: \(error.localizedDescription)")
    }
    return nil
}



func fetchBasicNumber() async -> Int? {
    let url = "http://124.222.86.204:32366/init/check"

    guard let url = URL(string: url) else {
        print("Invalid URL")
        return nil
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    do {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            if let httpResponse = response as? HTTPURLResponse {
                print("Error: Status code is \(httpResponse.statusCode)")
            } else {
                print("Error: Invalid response data")
            }
            return nil
        }

        return getBasicNumber(from: data)
    } catch {
        print("Error: \(error.localizedDescription)")
        return nil
    }
}
func calculateBeMd5(token: String, timeStamp: Int, basicNumber: Int, verb: String, query: String, body: String) -> String {
    var sosan = basicNumber | affectNumber
    let pas = sosan % 2
    sosan = basicNumber & pas + sosan + 1

    let param: String
    switch verb {
    case "GET":
        param = query
    case "POST", "PUT", "DELETE":
        param = query + body
    default:
        param = ""
    }

    let beMd5 = verb + param + String(timeStamp) + token + String(sosan)
    let md5 = Insecure.MD5.hash(data: beMd5.data(using: .utf8) ?? Data()).map { String(format: "%02hhx", $0) }.joined()
    return md5
}
func verifyToken(token: String = UserDefaults.standard.string(forKey: "userToken")!) async -> Bool {
    let url = "http://124.222.86.204:32366/User/Check"
    let timeStamp = Int(Date().timeIntervalSince1970)
    let basicNumber = (await fetchBasicNumber()) ?? 123834
    let md5 = calculateBeMd5(token: token, timeStamp: timeStamp, basicNumber: basicNumber, verb: "POST", query: "", body: "")

    guard let url = URL(string: url) else {
        print("Invalid URL")
        return false
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.setValue("\(timeStamp)", forHTTPHeaderField: "timeStamp")
    request.setValue(md5, forHTTPHeaderField: "Sign")
    request.setValue("\(affectNumber)", forHTTPHeaderField: "an")
    return await withCheckedContinuation { continuation in
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                continuation.resume(returning: false)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                if let httpResponse = response as? HTTPURLResponse {
                    print("Error: Status code is \(httpResponse.statusCode)")
                } else {
                    print("Error: Invalid response data")
                }
                continuation.resume(returning: false)
                return
            }

            continuation.resume(returning: true)
        }.resume()
    }
}
struct LoginResult: Codable {
    let token: String
    let expireAt: Int
}
struct LoginResponse: Codable {
    let status: Int
    let result: LoginResult
}
struct LoginRequest: Codable {
    let username: String
    let password: String
}
