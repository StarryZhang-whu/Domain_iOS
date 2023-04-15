//
//  CircleView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/12.
//

import SwiftUI

struct CircleView: View {
    @EnvironmentObject var modal:Modal
    @State var circle:RCircle = RCircle(name: "", creator: "")
    var body: some View {
        ZStack {
            ScrollView {
                    VStack {
                        Text("我加入的圈子")
                            .font(.footnote.weight(.semibold))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(15)
                            .padding(.top,20)
                        
                        CirclesRow.padding(.horizontal,20)
                        
                        Text("我管理的圈子")
                            .font(.footnote.weight(.semibold))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(15)
                            .padding(.top,5)
                        
                        CirclesRow.padding(.horizontal,20).padding(.bottom,20)
                        
                        menuSection
                    }
            }
            if(modal.showCircle){
                CircleDetail(circle: circle)
            }
        }
    }
    
    var CirclesRow:some View{
        ScrollView(.horizontal) {
            HStack(spacing:20) {
                ForEach(modal.circles){circle in
                    CircleCard(circle: circle).onTapGesture {
                        self.circle = circle
                        withAnimation(.spring()){
                            modal.showCircle.toggle()
                        }
                    }
                }
            }
        }
    }
    var menuSection: some View {
        VStack {
            Button{
                
            }label: {
                ListRow(title: "创建圈子", icon: "plus")
            }
            Divider()
            Button{}label: {
                ListRow(title: "加入圈子", icon: "person.2")
            }
            Divider()
            Button{
                
            }label: {
                ListRow(title: "管理圈子", icon: "key")
            }
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .padding(.horizontal, 20)
    }
}
struct ListRow: View {
    var title = "iOS Development"
    var icon = "iphone"
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .mask(Circle())
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "arrowshape.right")
        }
    }
}
struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
            .environmentObject(Modal())
    }
}
