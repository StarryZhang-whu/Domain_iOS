//
//  ContentView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/15.
//

import SwiftUI

struct TodoView: View {
<<<<<<< Updated upstream
=======
    @StateObject var todoshop:TodoShop = TodoShop()
>>>>>>> Stashed changes
    var body: some View {
        ZStack {
            ScrollView{
                Text("事项").frame(maxWidth: .infinity,alignment: .leading).font(.largeTitle).fontWeight(.bold)
                    .frame(height: 10)
                    .padding()
                    .padding(.top,20)
                VStack(){
                    HStack {
<<<<<<< Updated upstream
                        Image(systemName: "envelope.fill").foregroundColor(.accentColor)
                            .frame(height: 30)
                        .background(Rectangle().fill(.background))
=======
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.accentColor)
                            .frame(height: 30)
                            .background(Rectangle()
                                .fill(.background)
                            )
>>>>>>> Stashed changes
                        Text("**3**").foregroundColor(.accentColor)
                    }.frame(width: 100)
                }.frame(maxWidth: .infinity,alignment: .trailing)
                
<<<<<<< Updated upstream
                DaysView(todoList: todos[0], title: "今天")
                DaysView(todoList: todos[1], title: "明天")
                DaysView(todoList: todos[2], title: "3月14日")
=======
                DaysView(todoshop: todoshop, title: "今天")
                    .padding(.bottom, 20)
                    .sheet(isPresented: $todoshop.isEditing){
                        ItemDetail(todoshop: todoshop, locate: todoshop.editingAt)
                    }
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
            }.frame(width: self.size, height: self.size)
=======
            }
                .frame(width: self.size, height: self.size)
>>>>>>> Stashed changes
                .shadow(radius: 10)
            Group {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: size, height: size)
<<<<<<< Updated upstream
                    .foregroundColor(.accentColor)
=======
                    .foregroundColor(Color("AccentColor").opacity(0.5))
>>>>>>> Stashed changes
            }
        }
    }
}
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
