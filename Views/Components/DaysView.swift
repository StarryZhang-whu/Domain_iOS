//
//  DaysView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct DaysView: View {
<<<<<<< Updated upstream
    var todoList:[Todo]
=======
    @ObservedObject var todoshop:TodoShop
>>>>>>> Stashed changes
    var title:String
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
<<<<<<< Updated upstream
                .frame(height: 20)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading, 20.0)
            Divider()
            VStack {
                ForEach(todoList) { item in
                    TodoItem(todo:item)
                        .padding(10)
                }
            }
        }.padding(.top,10).background(Rectangle().fill(.ultraThinMaterial).cornerRadius(15).shadow(radius:4))
            .padding(.horizontal,20)
=======
                .frame(width: 70,height: 20)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading, 20.0)
                .background(Rectangle()
                    .fill(.white)
                    .frame(width: 70,height: 30)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(Color("AccentColor").opacity(0.5), lineWidth: 1)
                    )
                        .offset(x: 8)
                )
                .offset(x:5, y:-10)
        

            
            VStack {
                ForEach(todoshop.todos) { item in
                    TodoItem(todoshop: todoshop, locate: todoshop.todos.firstIndex(of: item)!)
                        .padding(10)
                }
            }
        }
            .padding(.bottom,10)
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
            
            
>>>>>>> Stashed changes
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< Updated upstream
        DaysView(todoList:todos[0],title:"今天")
=======
        DaysView(todoshop: TodoShop(), title:"今天")
>>>>>>> Stashed changes
    }
}
