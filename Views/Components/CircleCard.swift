//
//  CircleCard.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/12.
//

import SwiftUI

struct CircleCard: View {
    var circle:RCircle
    var body: some View {
        VStack(alignment: .leading,spacing: 15){
            Text("创建人："+circle.creator).font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            Text(circle.name)
                .fontWeight(.semibold).lineLimit(2)
            Text("人数："+circle.volumn.description).font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .frame(width: 160, height:150)
            .background(RoundedRectangle(cornerRadius: 30).fill(.ultraThinMaterial))
    }
}

struct CircleCard_Previews: PreviewProvider {
    static var previews: some View {
        CircleCard(circle: RCircle(name: "团委学生会呃呃呃呃", creator: "赵玥"))
    }
}
