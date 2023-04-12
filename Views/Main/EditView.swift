//
//  EditView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/31.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var modal:Modal
    @State var bio = ""
    @State var gender = "male"
    var body: some View {
        VStack(alignment: .leading){
            Text("编辑个人信息").font(.title).bold()
            HStack{
                AvatorView().overlay(Rectangle().fill(Color(.gray).opacity(0.3)).cornerRadius(20))
                    .overlay(Text("更改\n头像").foregroundColor(.white).font(.caption).shadow(radius: 5))
                VStack(alignment: .leading){
                    Text("姓名：" + modal.user.name).foregroundColor(Color("TextColor"))
                    HStack {
                        Text("个性签名:").foregroundColor(Color("TextColor"))
                        TextField(modal.user.bio,text: $bio)
                    }
                }
            }
            Divider()
            HStack {
                Text("性别")
                Picker(selection: $gender, label: Text("性别")) {
                    Text("男").tag("male")
                    Text("女").tag("female")
                    Text("不想告诉你").tag("unknown")
                }
            }
        }.padding(20).frame(maxHeight: .infinity,alignment: .top)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
            .environmentObject(Modal())
    }
}
