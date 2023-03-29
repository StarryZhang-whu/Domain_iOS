//
//  InboxItem.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/29.
//
import SwiftUI

struct InboxItem: View {
    @ObservedObject var todoshop:TodoShop
    var locate:Int
    
    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.down")
                .frame(width: 36, height: 36)
                .onTapGesture {
                    withAnimation(.spring()){
                        todoshop.inbox[locate].deleted = true
                    }
                   
                }

            Text(todoshop.inbox[locate].title).fontWeight(.semibold).lineLimit(1).foregroundColor(Color("TextColor"))
            Spacer()
            Text("from:"+todoshop.inbox[locate].circle.name)
                .font(.caption)
                .fontWeight(.light)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            todoshop.receivingAt = locate
            todoshop.isChecking = true
        }
    }
}

struct InboxItem_Previews: PreviewProvider {
    static var previews: some View {
        InboxItem(todoshop: TodoShop(), locate: 0)
    }
}
