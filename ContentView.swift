//
//  TabBar.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TodoView()
                .tabItem(){
                    Image(systemName: "list.bullet.below.rectangle")
                    Text("事项")
                }
            TodoView()
                .tabItem(){
                    Image(systemName: "newspaper")
                    Text("新闻")
                }
            TodoView()
                .badge(5)
                .tabItem(){
                    Image(systemName: "circle.circle.fill")
                    Text("圈子")
                }
            LoginView()
                .tabItem(){
                    Image(systemName: "person.circle")
                    Text("我的")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
