//
//  AccountView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/30.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var modal:Modal
    
    var body: some View {
        ZStack {
            NavigationView{
                List{
                    if(modal.isLogin)
                    {
                        
                    }
                    else
                    {
                        Button{
                            modal.showModal.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .symbolVariant(.circle.fill)
                                    .font(.system(size:50))
                                    .foregroundColor(Color("SecondaryColor").opacity(0.5))
                                
                                Text("尚未登录").font(.system(size: 20)).foregroundColor(Color("TextColor"))
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                    }
                    Section{
                        NavigationLink {} label: {
                            Label("设置", systemImage: "gear")
                        }
                        NavigationLink {} label: {
                            Label("隐私", systemImage: "lock.doc")
                        }
                        NavigationLink {} label: {
                            Label("帮助", systemImage: "questionmark.circle")
                        }
                    }
                    NavigationLink { about } label: {
                        Label("关于", systemImage: "info.circle")
                    }
                }
                .navigationTitle("账户")
            }
            if(modal.showModal){
                ModalView()
            }
        }
    }
    var about: some View{
        Text("Vulpecula")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(Modal())
    }
}
