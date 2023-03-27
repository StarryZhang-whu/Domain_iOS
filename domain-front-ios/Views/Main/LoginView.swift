//
//  LoginView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/17.
//

import SwiftUI
import Combine
import Foundation


struct LoginView: View {
    @StateObject var userAuthentication = UserAuthentication()
    @State var account:String = ""
    @State var password:String = ""
    
    @State var isLoading = false
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            Text("登录")
                .font(.largeTitle).bold().foregroundStyle(.linearGradient(colors: [.accentColor,Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("开始使用Domain，做时间的主人。")
                .font(.headline)
                .foregroundColor(.secondary)
            form
        }
        .padding(20)
        .padding(.vertical,20)
        .background(.thinMaterial)
        .cornerRadius(30)
        
    }
    var form: some View {
        Group {
            TextField("邮箱/ID",text:$account).textField(icon: "envelope.open.fill")
            SecureField("密码", text: $password)
                .textField(icon: "key")
            Button{
                Task{
                    handleLogin()
                }
            } label: {
                Text("登录")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(.linearGradient(colors: [.white.opacity(0.8), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom)))
                
            }
            Divider()
            Text("没有账号？**点击注册**").font(.footnote)
                .foregroundColor(.primary.opacity(0.7))
                .accentColor(.primary.opacity(0.7))
        }
    }
    func handleLogin() {
        isLoading = true
        Task {
            let loginSuccess = await userAuthentication.login(username: account, password: password)
            if loginSuccess {
                print("Login successful")
                if let token = userAuthentication.userToken {
                    print("User token: \(token)")
                    let verifySuccess = await verifyToken()
                    if verifySuccess {
                        print("Token verification successful")
                    } else {
                        print("Token verification failed")
                    }
                }
            } else {
                print("Login failed")
            }
            DispatchQueue.main.async {
                isLoading = false
            }
        }
    }



}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
