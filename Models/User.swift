import Combine
import Foundation
import CryptoKit

class UserAuthentication: ObservableObject {
    @Published var userToken: String? = UserDefaults.standard.string(forKey: "userToken")
    func login(username: String, password: String) async -> Bool {
        let url = "http://124.222.86.204:32366/User/Login"
        let loginRequest = LoginRequest(username: username, password: password)
        
        guard let url = URL(string: url),
              let requestBody = try? JSONEncoder().encode(loginRequest) else {
            print("Invalid URL or request body")
            return false
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestBody

        return await withCheckedContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    continuation.resume(returning: false)
                    return
                }

                guard let data = data,
                      let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200,
                      let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                    if let httpResponse = response as? HTTPURLResponse {
                            print("Error: Status code is \(httpResponse.statusCode)")
                        } else {
                            print("Error: Invalid response data")
                        }
                    continuation.resume(returning: false)
                    return
                }
                // 存储Token到UserDefaults
                UserDefaults.standard.set(loginResponse.result.token, forKey: "userToken")
                DispatchQueue.main.async {
                    self.userToken = loginResponse.result.token
                                }
                continuation.resume(returning: true)
            }.resume()
        }
    }
    
}
