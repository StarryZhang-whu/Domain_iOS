//
//  InboxDetailView.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/29.
//

import SwiftUI

struct InboxDetailView: View {
    @ObservedObject var todoshop:TodoShop
    var locate:Int
    
    
    var body: some View {
        VStack{
            Spacer().frame(height: 40)
            HStack{
                Spacer().frame(width: 30)
                Button(){
                    
                }label: {
                    Image(systemName: "heart.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .tint(.black.opacity(0.8))
                }
                Spacer()
                
                Button(){
                    
                }label: {
                    Image(systemName: "square.and.pencil.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .tint(.black.opacity(0.8))
                    
                }
                Spacer().frame(width: 30)
            }
            HStack{
                Spacer().frame(width: 30)
                Text(todoshop.inbox[locate].title)
                    .font(.system(size: 40))
                Spacer()
            }
            HStack{
                Spacer().frame(width: 30)
                Text("发布时间"+todoshop.inbox[locate].startDate.formatted())
                    .font(.system(size: 20))
                Spacer()
            }
            .padding(.bottom,10)
            VStack{
                
                HStack{
                    Spacer().frame(width: 10)
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .tint(.black)
                    Spacer().frame(width: 20)
                    Text(todoshop.inbox[locate].publisher) .font(.system(size: 20))
                    Spacer()
                }.padding(20)
                    .padding(.top,10)
                
                Divider()
                
                HStack{
                    Spacer().frame(width: 10)
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .tint(.black)
                    Spacer().frame(width: 20)
                    Text(todoshop.inbox[locate].detail) .font(.system(size: 20))
                        .lineLimit(6)
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
                    Text(date2String(_:todoshop.inbox[locate].endDate)).font(.system(size: 20))
                    Spacer()
                }.padding(20)
                    .padding(.bottom,5)
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
            
            VStack{
                HStack{
                    Spacer().frame(width: 10)
                    Image(systemName: "c.circle")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .tint(.black)
                    Spacer().frame(width: 20)
                    Text(todoshop.todos[locate].circle.name) .font(.system(size: 20))
                    Spacer()
                }.padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(Color("AccentColor").opacity(0.5), lineWidth: 1)
                        
                    )
            }
            .frame(width: UIScreen.main.bounds.width-50)
            .background(Rectangle()
                .fill(.white)
                .cornerRadius(15)
                .shadow(radius:4)
            )
            .padding(.horizontal,20)
            .padding(.bottom, 30)
            
            Button(){
                withAnimation(.spring()){
                    todoshop.receiveInbox(atInbox: locate)
                }
                
            }label: {
                ZStack{
                    Rectangle()
                        .tint(Color("AccentColor").opacity(0.5))
                        .cornerRadius(15)
                    HStack{
                        Spacer()
                        Text("收件").tint(.black)
                        Spacer()
                        Image(systemName: "square.and.arrow.down")
                            .tint(.black)
                        Spacer().frame(width: 10)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width-50,height: 40)
            .padding(.bottom,30)
            
            
            Button(){
                withAnimation(.spring()){
                    todoshop.isEditing = false
                    todoshop.rmInbox(i: locate)
                }
                
            }label: {
                ZStack{
                    Rectangle()
                        .tint(.red.opacity(0.7))
                        .cornerRadius(15)
                    HStack{
                        Spacer()
                        Text("删除").tint(.black)
                        Spacer()
                        Image(systemName: "trash")
                            .tint(.black)
                        Spacer().frame(width: 10)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width-50,height: 40)
            Spacer()
            
        }
    }
}

struct InboxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InboxDetailView(todoshop: TodoShop(), locate: 0)
    }
}
