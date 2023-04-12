//
//  CircleDetail.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/12.
//

import SwiftUI

struct CircleDetail: View {
    @EnvironmentObject var modal:Modal
    var circle:RCircle
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            HStack {
                Text(circle.name).font(.system(size: 35)).bold()
                Spacer()
                Button{
                    modal.showCircle.toggle()
                }label: {
                    Image(systemName: "xmark.circle").font(.system(size: 30)).foregroundColor(.secondary)
                }
                
            }.padding(.top,15)
            Divider()
            Text("创建人："+circle.creator).font(.callout).foregroundColor(.secondary)
            Text("成员：").font(.callout).foregroundColor(.secondary)
            VStack {
                ForEach(0..<5) {_ in
                    HStack{
                        ForEach(0..<6){_ in
                            AvatorView()
                        }
                    }
                }
            }
        }.padding().frame(width: 370).background(RoundedRectangle(cornerRadius: 30).fill(.thinMaterial)).background(Image("Blob").offset(x:160,y: 50))
    }
}

struct CircleDetail_Previews: PreviewProvider {
    static var previews: some View {
        CircleDetail(circle:RCircle(name: "团委学生会", creator: "赵玥")).environmentObject(Modal())
    }
}
