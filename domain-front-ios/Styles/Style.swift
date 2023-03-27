//
//  Style.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/17.
//

import SwiftUI

struct gradientStyleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content.foregroundStyle(.linearGradient(colors: [.accentColor,Color("SecondaryColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
extension View{
    func gradientStyle() -> some View {
        self.modifier(gradientStyleModifier())
    }
}
