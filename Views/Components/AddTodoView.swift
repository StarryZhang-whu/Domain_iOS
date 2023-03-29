//
//  AddItem.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/28.
//

var Ctest:[RCircle] = [
    RCircle(id: 1, name: "团学"),
    RCircle(id: 2, name: "计科7班"),
    RCircle(id: 3, name: "vulpecula")
]

import SwiftUI

struct AddTodoView: View {
    @ObservedObject var todoshop:TodoShop
    let startTime:Date = Date()
    @State var title:String = ""
    @State var detail:String = ""
    @State var ddl:Date = Date()
    @State var curCircle:RCircle = Ctest[0]
    
    var body: some View {
        VStack{
            Spacer().frame(height: 40)
            HStack{
                Spacer().frame(width: 25)
                Text("发布新事项").font(.system(size: 40))
                Spacer()
            }
            HStack{
                Spacer().frame(width: 25)
                TextField("编辑标题", text: $title, axis: .vertical)
                    .lineLimit(1)
                    .frame(width: UIScreen.main.bounds.width/2)
                    .padding(10)
                    .background(Color.gray.opacity(0.12).cornerRadius(12))
                Spacer()
            }
            .padding(.bottom, 20)
            
            
            VStack{
                
                HStack{
                    Spacer().frame(width: 10)
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .tint(.black)
                    Spacer().frame(width: 20)
                    Text("SundayV").font(.system(size: 20))
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
                    TextField("编辑事项详情", text: $detail, axis: .vertical)
                        .lineLimit(6)
                        .padding(15)
                        .background(Color.gray.opacity(0.12).cornerRadius(12))
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
                    DatePicker("", selection: $ddl,in:startTime..., displayedComponents: [.date,.hourAndMinute]).offset(x:-55)
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
                    Picker("圈子", selection: $curCircle){
                        ForEach(Ctest, id:\.self){ circle in
                            Text(circle.name)
                        }
                    }
                    .accentColor(.black)
                    .background(Color.gray.opacity(0.12).cornerRadius(12))
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
                var temp:Todo = Todo(title: title, startDate: Date(), endDate: ddl, circle: curCircle, detail: detail, publisher: "SundayV")
                withAnimation(.spring()){
                    todoshop.isAdding = false
                    todoshop.addTodo(item: temp)
                }
            }label: {
                ZStack{
                    Rectangle()
                        
                        .tint(Color("AccentColor").opacity(0.8))
                        .cornerRadius(15)
                    HStack{
                        Spacer()
                        Text("发布").tint(.black)
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
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

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(todoshop: TodoShop())
    }
}

