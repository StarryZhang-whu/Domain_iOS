//
//  ContentView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/15.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        ZStack {
            ScrollView{
                Text("事项").frame(maxWidth: .infinity,alignment: .leading).font(.largeTitle).fontWeight(.bold)
                    .frame(height: 10)
                    .padding()
                    .padding(.top,20)
                VStack(){
                    HStack {
                        Image(systemName: "envelope.fill").foregroundColor(.accentColor)
                            .frame(height: 30)
                        .background(Rectangle().fill(.background))
                        Text("**3**").foregroundColor(.accentColor)
                    }.frame(width: 100)
                }.frame(maxWidth: .infinity,alignment: .trailing)
                
                DaysView(todoList: todos[0], title: "今天")
                DaysView(todoList: todos[1], title: "明天")
                DaysView(todoList: todos[2], title: "3月14日")
            }
            addButton(size: 60).offset(x: UIScreen.main.bounds.width/2 - 60, y: UIScreen.main.bounds.height/2 - 180)
        }
    }
}
struct addButton: View {
    var size: CGFloat
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .fill(Color(.white))
            }.frame(width: self.size, height: self.size)
                .shadow(radius: 10)
            Group {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: size, height: size)
                    .foregroundColor(.accentColor)
            }
        }
    }
}
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
