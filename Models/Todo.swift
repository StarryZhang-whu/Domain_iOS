//
<<<<<<< Updated upstream
//  Todo.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
=======
//  TodoItem.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/28.
>>>>>>> Stashed changes
//

import SwiftUI

<<<<<<< Updated upstream
struct Todo: Identifiable {
    var id: Int
    var title: String
    var deadline: Date
    var icon: String = "square.and.pencil.circle.fill"
}

var todos = [[
    Todo(id:1,title: "猛猛的摸鱼",deadline: Date.init()),
    Todo(id:2,title: "速成Figma",deadline: Date.init()),
    Todo(id:3,title: "完成Domain iOS端",deadline: Date.init())],
    [Todo(id:1,title: "完成作业",deadline: Date.init())],
    [Todo(id:1,title: "不会编了",deadline: Date.init()),
     Todo(id:2,title: "完成青年大学习第114514期",deadline: Date.init())]
]
=======
struct Todo: Identifiable,Equatable,Decodable,Encodable{
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:UUID = UUID()
    var title:String = ""
    var startDate:Date = Date()
    var endDate:Date = Date()
    var isPinned = false
    var detail:String = ""
    var circle:String = ""
    var status:Int = 0
    var isUpdate:Bool = false;
    var publisher:String = ""
    
    init(){
        
    }
    
    init(title: String, startDate:Date, endDate:Date, circle:String){
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.circle = circle
    }
    init(title: String, startDate:Date, endDate:Date, circle:String, detail:String, publisher:String){
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.circle = circle
        self.detail = detail
        self.publisher = publisher
    }
}
>>>>>>> Stashed changes
