//
//  DaysView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct DaysView: View {
    var todoList:[Todo]
    var title:String
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
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
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(todoList:todos[0],title:"今天")
    }
}
