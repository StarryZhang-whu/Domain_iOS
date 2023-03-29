//
//  ContentView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/15.
//

import SwiftUI

struct TodoView: View {
    @StateObject var todoshop:TodoShop = TodoShop()
    var body: some View {
        ZStack {
            ScrollView{
                Spacer().frame(height: 60)
                VStack(){
                    Button(){
                        withAnimation(.spring()){
                            todoshop.isReceiving = true
                        }
                    } label: {
                        Image(systemName: "envelope")
                            .resizable()
                            .foregroundColor(.red.opacity(0.7))
                        
                            .frame(width: 25,height: 20)
                            .background(Rectangle()
                                .fill(.background)
                            )
                            .padding(5)

                        Text("**3**").foregroundColor(.red.opacity(0.7)).font(.system(size: 20))
                    }
                        .frame(width: 80)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                 .stroke(.red.opacity(0.7), lineWidth: 2)
                        )
                        .offset(x:-25)
                }.frame(maxWidth: .infinity,alignment: .trailing)
                DaysView(todoshop: todoshop, title: "今天")
                    .padding(.bottom, 20)
                    
            }
            
            addButton(size: 60).offset(x: UIScreen.main.bounds.width/2 - 60, y: UIScreen.main.bounds.height/2 - 180)
                .onTapGesture {
                    todoshop.isAdding = true
                }
            if(todoshop.isReceiving){
                InboxView(todoshop: todoshop)
            }
        }
        .sheet(isPresented: $todoshop.isEditing){
            TodoDetailView(todoshop: todoshop, locate: todoshop.editingAt)
        }
        .sheet(isPresented: $todoshop.isAdding){
            AddTodoView(todoshop: todoshop)
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
            }
                .frame(width: self.size, height: self.size)

                .shadow(radius: 10)
            Group {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: size, height: size)
                    .foregroundColor(Color("AccentColor").opacity(0.5))
            }
        }
    }
}
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
