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
                    Image(systemName: "checklist")
                    Text("事项")
                }
            TodoView()
                .tabItem(){
                    Image(systemName: "cup.and.saucer")
                    Text("新闻")
                }
            TodoView()
                .badge(5)
                .tabItem(){
                    Image(systemName: "c.circle")
                    Text("圈子")
                }
            AccountView()
                .tabItem(){
                    Image(systemName: "person.circle")
                    Text("我的")
                }
        }
        .onAppear{
            let appeareance = UITabBarAppearance()
            appeareance.shadowColor = UIColor(Color.black)

            UITabBar.appearance().backgroundColor = UIColor(.white)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Modal())
            .environmentObject(UserAuthentication())
    }
}
