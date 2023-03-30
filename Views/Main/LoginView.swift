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
    @EnvironmentObject var userAuthentication:UserAuthentication
    @EnvironmentObject var modal:Modal
    @State var account:String = ""
    @State var password:String = ""
    @State var isLoading = false
    var body: some View {
        ZStack {
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
            .background(RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors: [.accentColor.opacity(0.4), Color("SecondaryColor").opacity(0.4)], startPoint: .top, endPoint: .bottom)).shadow(radius: 10))
            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
            //.background(Rectangle().fill(.thickMaterial))
            //.cornerRadius(30)
            .padding(15)
            
        }
        
        
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
                .onTapGesture{
                    withAnimation(){
                        modal.selectedModal = .register
                    }
                }
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
                        modal.isLogin = true
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
            .environmentObject(UserAuthentication())
            .environmentObject(Modal())
    }
}
