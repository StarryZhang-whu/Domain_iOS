//
//  TodoShop.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/28.
//

import SwiftUI


class TodoShop: ObservableObject{
    @Published var inbox:[Todo]
    @Published var todos:[Todo]
    @Published var editingAt:Int = 0
    @Published var isEditing:Bool = false
    @Published var isAdding:Bool = false
    @Published var isReceiving:Bool = false
    @Published var receivingAt:Int = 0
    @Published var isChecking:Bool = false
    
    init(){
        if let data = try UserDefaults.standard.data(forKey: "todos"){
            if let decoded = try? JSONDecoder().decode([Todo].self, from: data){
                self.todos = decoded
            }else{
                todos = [
                    Todo(title: "写作业",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: Ctest[0],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
                    Todo(title: "睡觉",startDate: Date(timeIntervalSinceNow: -1500), endDate: Date(timeIntervalSinceNow: 2500), circle: Ctest[1],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
                    Todo(title: "摸鱼",startDate: Date(timeIntervalSinceNow: -2000), endDate: Date(timeIntervalSinceNow: 500), circle: Ctest[2],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
                ]
            }
        }else{
            todos = [
                Todo(title: "寄了",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: RCircle(name: "system",creator: "1"), detail:"看到这条消息，你的userdefault里应该是没有任何数据的，考虑一下连个网吧～",publisher:"SundayV")
                
            ]
        }
        
        if let data = try UserDefaults.standard.data(forKey: "inbox"){
            if let decoded = try? JSONDecoder().decode([Todo].self, from: data){
                self.inbox = decoded
            }else{
                inbox = [
                    Todo(title: "收信箱测试",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: Ctest[0],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
                    Todo(title: "收信箱测试2",startDate: Date(timeIntervalSinceNow: -1500), endDate: Date(timeIntervalSinceNow: 2500), circle: Ctest[1],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
                ]

            }
        }else{
            inbox = [
                Todo(title: "收信箱测试",startDate: Date(timeIntervalSinceNow: -1000), endDate: Date(timeIntervalSinceNow: 300), circle: Ctest[0],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
                Todo(title: "收信箱测试2",startDate: Date(timeIntervalSinceNow: -1500), endDate: Date(timeIntervalSinceNow: 2500), circle: Ctest[1],detail:"看到这条消息，你大抵是正常的",publisher:"SundayV"),
            ]
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
    
    func rmTodo(i:Int){
        self.todos[i].deleted = true
        save()
    }
    
    func rmInbox(i:Int){
        self.inbox[i].deleted = true
        save()
    }
    
    func receiveInbox(atInbox:Int){
        self.inbox[atInbox].received = true
        self.todos.append(inbox[atInbox])
        save()
    }
    
    func checkToggle(at:Int){
        let dispatchWorkItem = DispatchWorkItem {
            withAnimation(.spring()){
                self.todos[at].deleted = true
            }
        }
        if(!todos[at].deleting){
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: dispatchWorkItem)
        }else{
            dispatchWorkItem.cancel()
        }
        todos[at].deleting.toggle()
    }
}

