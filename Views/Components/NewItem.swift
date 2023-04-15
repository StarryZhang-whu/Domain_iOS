//
//  NewItem.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/15.
//

import SwiftUI

struct NewItem: View {
    var new:New = news[0]
    var body: some View{
        VStack{
            LogoView(image: new.logo)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(new.title)
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                Text(new.subtitle.uppercased())
                    .font(.footnote).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white.opacity(0.7))
                
                Text(new.text)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .cornerRadius(30)
                    .blur(radius: 30)
            )
        }
        .background(
            Image(new.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .disabled(true)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30))
    }
}

struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItem()
    }
}
