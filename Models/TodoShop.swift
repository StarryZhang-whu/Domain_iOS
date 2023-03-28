//
//  TodoShop.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/28.
//

import SwiftUI

class TodoShop: ObservableObject{
    @Published var todos:[Todo]
    @Published var editingAt:Int = -1
    @Published var isEditing:Bool = false
    
    init(){
        if let data = try UserDefaults.standard.data(forKey: "todos"){
            if let decoded = try? JSONDecoder().decode([Todo].self, from: data){
                self.todos = decoded
            }else{
                todos = [
                    Todo(title: "写作业",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: "2021级计科7班"),
                    Todo(title: "睡觉",startDate: Date(timeIntervalSinceNow: -1500), endDate: Date(timeIntervalSinceNow: 2500), circle: "健康中心"),
                    Todo(title: "摸鱼",startDate: Date(timeIntervalSinceNow: -2000), endDate: Date(timeIntervalSinceNow: 500), circle: "自己"),
                ]
            }
        }else{
            todos = [
                Todo(title: "寄了",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: "system", detail:"看到这条消息，你的userdefault里应该是没有任何数据的，考虑一下连个网吧～",publisher:"SundayV")
            ]
            return
        }
    }
    func save(){
        if let encoded = try? JSONEncoder().encode(todos.self){
            UserDefaults.standard.set(encoded, forKey: "todos")
        }
    }
    
    func addTodo(item:Todo){
        self.todos.append(item)
        save()
    }
}

