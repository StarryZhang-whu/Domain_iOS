//
//  Todo.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

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
