//
//  TodoItem.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct TodoItem: View {
<<<<<<< Updated upstream
    var todo:Todo
    
    var body: some View {
        HStack {
            Image(systemName: todo.icon).foregroundColor(Color("SecondaryColor"))
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .mask(Circle())
            Text(todo.title).fontWeight(.semibold).lineLimit(1).foregroundColor(Color("TextColor"))
            Spacer()
            Text(todo.deadline.formatted())
                .font(.caption)
                .fontWeight(.light)
        }
=======
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
>>>>>>> Stashed changes
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< Updated upstream
        TodoItem(todo: todos[0][0])
=======
        TodoItem(todoshop: TodoShop(), locate: 0)
>>>>>>> Stashed changes
    }
}
