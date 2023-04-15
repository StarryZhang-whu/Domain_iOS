//
//  BannerView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/15.
//

import SwiftUI

struct BannerView: View {
    var new: New = news[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Group{
                Image(new.logo)
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(18)
                    .modifier(OutlineOverlay(cornerRadius: 18))
                Text(new.title)
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(new.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.primary)
                Text(new.text)
                    .font(.footnote)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        //.backgroundColor(opacity: 0.5)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
