//
//  DaysView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct DaysView: View {
    @ObservedObject var todoshop:TodoShop
    var title:String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .frame(width: 70,height: 20)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading, 20.0)
                .background(Rectangle()
                    .fill(.white)
                    .frame(width: 70,height: 30)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(Color("AccentColor").opacity(0.5), lineWidth: 1)
                    )
                        .offset(x: 8)
                )
                .offset(x:5, y:-10)
        

            
            VStack {
                ForEach(todoshop.todos) { item in
                    if(!item.deleted){
                        TodoItem(todoshop: todoshop, locate: todoshop.todos.firstIndex(of: item)!)
                            .padding(10)
                    }
                    
                }
            }
        }
            .padding(.bottom,10)
            .background(Rectangle()
                .fill(.white)
                .cornerRadius(15)
                .shadow(radius:4)
                .overlay(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color("AccentColor").opacity(0.5), lineWidth: 1)
                            
                )
            )
            .padding(.horizontal,20)
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(todoshop: TodoShop(), title:"今天")
    }
}

//func filterTodayTasks(){
//        DispatchQueue.global(qos: .userInteractive).async {
//            let calendar = Calendar.current
//            let filtered = self.storedTasks.filter {
//                return calendar.isDate($0.taskDate, inSameDayAs: self.currentDay)
//            }
//
//                .sorted{ task1 ,task2  in
//                    return task2.taskDate < task1.taskDate
//
//                }
//
//
//            DispatchQueue.main.async {
//                withAnimation {
//                    self.filteredTasks = filtered
//                }
//            }
//        }
//    }
