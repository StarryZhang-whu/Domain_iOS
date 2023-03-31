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
    var body: some View {
        VStack(alignment: .leading){
            Text("编辑个人信息").font(.title).bold()
            HStack{
                AvatorView()
                VStack(alignment: .leading){
                    Text("姓名：" + modal.user.name)
                    TextField(modal.user.bio,text: $bio)
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
