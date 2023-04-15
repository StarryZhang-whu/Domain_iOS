//
//  LogoView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/15.
//

import SwiftUI

struct LogoView: View {
    var image = "Logo"
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
