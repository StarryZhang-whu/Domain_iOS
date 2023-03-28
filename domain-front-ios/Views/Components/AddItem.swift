//
//  AddItem.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/28.
//

import SwiftUI

struct AddItem: View {
    @ObservedObject var todoshop:TodoShop
    @State var temp:Todo = Todo()
    
    var body: some View {
        VStack{

            HStack{
                Spacer().frame(width: 10)
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .tint(.black)
                Spacer().frame(width: 20)
                Text("SundayV")
                Spacer()
            }.padding(20)
            
            Divider()
            
            HStack{
                Spacer().frame(width: 10)
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .tint(.black)
                Spacer().frame(width: 20)
                TextField("编辑事项详情", text: $temp.detail)
                Spacer()
            }.padding(20)
            
            Divider()
            
            HStack{
                Spacer().frame(width: 10)
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .tint(.black)
                Spacer().frame(width: 20)
                
                Spacer()
            }.padding(20)
        }
        .frame(width: UIScreen.main.bounds.width-50)
                .background(Rectangle()
                .fill(.white)
                .cornerRadius(15)
                .shadow(radius:4)
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color("AccentColor").opacity(0.5), lineWidth: 1)
                            
                )
            )
            .padding(.horizontal,20)
            .padding(.bottom, 30)
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem(todoshop: TodoShop())
    }
}
