//
//  CustomFieldModifier.swift
//  CustomFieldModifier
//
//  Created by Meng To on 2021-08-03.
//

import SwiftUI
struct OutlineOverlay: ViewModifier {
    var cornerRadius: CGFloat = 20
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(0.6),
                            .black.opacity(0.3)
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}
struct TextFieldModifier: ViewModifier {
    var icon: String
    
    func body(content: Content) -> some View {
        content
            .overlay(
                HStack {
                    Image(systemName: icon)
                        .frame(width: 36, height: 36)
                        .background(.thinMaterial)
                        .cornerRadius(14)
                        .modifier(OutlineOverlay(cornerRadius: 14))
                        .offset(x: -46)
                        .gradientStyle()
                        
                    Spacer()
                }
            )
            .foregroundStyle(.primary)
            .padding(15)
            .padding(.leading, 40)
            .background(.thinMaterial)
            .cornerRadius(20)
            .modifier(OutlineOverlay(cornerRadius: 20))
    }
}

extension View {
    func textField(icon: String) -> some View {
        self.modifier(TextFieldModifier(icon: icon))
    }
}
