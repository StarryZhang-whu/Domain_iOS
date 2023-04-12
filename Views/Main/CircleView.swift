//
//  CircleView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/12.
//

import SwiftUI

struct CircleView: View {
    @EnvironmentObject var modal:Modal
    var body: some View {
        VStack {
            Text("我的圈子")
                .font(.footnote.weight(.semibold))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(15)
            
            CirclesRow.padding(.horizontal,20)
        }
    }
    
    var CirclesRow:some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:20) {
                ForEach(modal.circles){circle in
                    CircleCard(circle: circle)
                }
            }
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
            .environmentObject(Modal())
    }
}
