//
//  TodoItem.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct TodoItem: View {
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
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todo: todos[0][0])
    }
}
