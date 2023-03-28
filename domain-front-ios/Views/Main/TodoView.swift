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
                Text("事项").frame(maxWidth: .infinity,alignment: .leading).font(.largeTitle).fontWeight(.bold)
                    .frame(height: 10)
                    .padding()
                    .padding(.top,20)
                VStack(){
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.accentColor)
                            .frame(height: 30)
                            .background(Rectangle()
                                .fill(.background)
                            )
                        Text("**3**").foregroundColor(.accentColor)
                    }.frame(width: 100)
                }.frame(maxWidth: .infinity,alignment: .trailing)
                
                DaysView(todoshop: todoshop, title: "今天")
                    .padding(.bottom, 20)
                    .sheet(isPresented: $todoshop.isEditing){
                        ItemDetail(todoshop: todoshop, locate: todoshop.editingAt)
                    }
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
