//
//  NewsView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/16.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        ScrollView {
            BannerView()
                .cornerRadius(30)
                .modifier(OutlineModifier(cornerRadius: 30))
                .shadow(color: Color("Shadow").opacity(0.3),
                        radius: 30, x: 0, y: 30)
                .overlay(
                    Image(news[0].image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: 70, y: -80)
                        .frame(height: 230)
                        //.offset(x: proxy.frame(in: .global).minX / 2)
                )
                .background(
                    Image("Blob")
                        .offset(x: 250, y: -100)
                        .accessibility(hidden: true)
                )
                .padding(20)
                .padding(.top,50)
            
            Text("计科先锋".uppercased())
                .modifier(SectionTitleModifier())
                .offset(y: -20)
                .accessibilityAddTraits(.isHeader)
                .padding(.top,20)
            
            NewItem().frame(height:200).padding(.horizontal)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
