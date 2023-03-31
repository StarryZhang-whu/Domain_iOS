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
            if(todoshop.todos[locate].deleting){
                Image(systemName: "checkmark.square").foregroundColor(.gray)
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        withAnimation(.spring()){
                            todoshop.todos[locate].deleting = false
                        }
                    }
            }else{
                Image(systemName: "square").foregroundColor(.black)
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        withAnimation(.spring()){
                            todoshop.todos[locate].deleting = true
                        }
                        let dispatchWorkItem = DispatchWorkItem {
                            withAnimation(.spring()){
                                if(todoshop.todos[locate].deleting){
                                    todoshop.todos[locate].deleted = true
                                }
                                
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: dispatchWorkItem)
                    }
            }
                
            Text(todoshop.todos[locate].title).fontWeight(.semibold).lineLimit(1).foregroundColor(Color("TextColor"))
            Spacer()
            Text(todoshop.todos[locate].endDate.formatted())
                .font(.caption)
                .fontWeight(.light)
        }
        .contentShape(Rectangle())
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

func checkToggle(item:DispatchWorkItem, at:Int, deleting:Bool){
    if(!deleting){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: item)
    }else{
        item.cancel()
    }
}
