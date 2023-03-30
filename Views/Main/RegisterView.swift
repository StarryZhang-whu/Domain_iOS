//
//  LoginView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/17.
//

import SwiftUI
import Combine
import Foundation

struct RegisterView: View {
    @EnvironmentObject var userAuthentication:UserAuthentication
    @EnvironmentObject var modal:Modal
    @State var email:String = ""
    @State var password:String = ""
    @State var identifyID:String = ""
    @State var name:String = ""
    @State var isLoading = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading,spacing: 20){
                Text("注册")
                    .font(.largeTitle).bold().foregroundStyle(.linearGradient(colors: [.accentColor,Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text("注册一个Domain账号 开启美好校园生活")
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
            TextField("武汉大学邮箱",text:$email).textField(icon: "envelope.open.fill")
            SecureField("密码", text: $password)
                .textField(icon: "key")
            Divider()
            HStack {
                TextField("验证码",text:$identifyID).textField(icon: "envelope.badge")
            }
            Button{
                
            } label: {
                Text("注册")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(.linearGradient(colors: [.white.opacity(0.8), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom)))
                
            }
            Divider()
            Text("已有账号？**点击登录**").font(.footnote)
                .foregroundColor(.primary.opacity(0.7))
                .accentColor(.primary.opacity(0.7))
                .onTapGesture{
                    withAnimation(){
                        modal.selectedModal = .login
                    }
                }
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserAuthentication())
            .environmentObject(Modal())
    }
}
