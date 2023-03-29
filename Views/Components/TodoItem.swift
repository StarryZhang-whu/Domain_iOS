//
//  TodoItem.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct TodoItem: View {
    @ObservedObject var todoshop:TodoShop
    var locate:Int
    
    var body: some View {
        HStack {
            Image(systemName: "square")
                .frame(width: 36, height: 36)

            Text(todoshop.todos[locate].title).fontWeight(.semibold).lineLimit(1).foregroundColor(Color("TextColor"))
            Spacer()
            Text(todoshop.todos[locate].endDate.formatted())
                .font(.caption)
                .fontWeight(.light)
        }
        .onTapGesture {
            todoshop.editingAt = locate
            todoshop.isEditing = true
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todoshop: TodoShop(), locate: 0)
    }
}
