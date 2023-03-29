//
//  ItemDetail.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/27.
//

import SwiftUI

var temp = Todo(title: "写作业",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: Ctest[0])

func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd") -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale.init(identifier: "zh_CN")
    formatter.dateFormat = dateFormat
    let date = formatter.string(from: date)
    return date
}

struct TodoDetailView: View {
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
                Text(todoshop.todos[locate].title)
                    .font(.system(size: 40))
                Spacer()
            }
            VStack{

                HStack{
                    Spacer().frame(width: 10)
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .tint(.black)
                    Spacer().frame(width: 20)
                    Text(todoshop.todos[locate].publisher) .font(.system(size: 20))
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
                    Text(todoshop.todos[locate].detail) .font(.system(size: 20))
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
                    Text(date2String(_:todoshop.todos[locate].endDate)).font(.system(size: 20))
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
                    todoshop.isEditing = false
                    todoshop.rmTodo(i: locate)
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
//        .overlay(
//            RoundedRectangle(cornerRadius: 15, style: .continuous)
//                .stroke(Color("AccentColor").opacity(0.5), lineWidth: 2)
//        )
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todoshop: TodoShop(), locate: 0)
    }
}
