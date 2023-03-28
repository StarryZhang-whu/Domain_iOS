//
//  TodoItem.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/28.
//

import SwiftUI

struct TodoItem: Identifiable,Equatable,Decodable,Encodable{
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:UUID = UUID()
    var title:String = ""
    var startDate:Date
    var endDate:Date
    var isPinned = false
    var detail:String = ""
    var circle:String = ""
    var status:Int = 0
    var isUpdate:Bool = false;
    
    
    init(title: String, startDate:Date, endDate:Date, circle:String){
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.circle = circle
    }
}
