//
//  ModalView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/30.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var modal: Modal
    @State var appear = false
    @State var appearBackground = false
    @State var viewState = CGSize.zero
    func dismissModal() {
        withAnimation {
            appear = false
            appearBackground = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            modal.showModal = false
        }
    }
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                if value.translation.height > 300 {
                    dismissModal()
                } else {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        viewState = .zero
                    }
                }
            }
    }
    var body: some View {
        ZStack {
            Rectangle().fill(.ultraThinMaterial).opacity(appear ? 1 : 0).ignoresSafeArea().blur(radius: 0).onTapGesture {
                dismissModal()
            }
            
            GeometryReader { proxy in
                Group {
                    switch modal.selectedModal {
                    case .register:
                        RegisterView()
                    case .login:
                        LoginView()
                    }
                }
                .rotationEffect(.degrees(viewState.width / 40))
                .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0), perspective: 1)
                //.shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                //.padding(20)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(drag)
                .frame(maxHeight: .infinity, alignment: .center)
                .offset(y: appear ? 0 : proxy.size.height)
                .background(
                    Image("Blob").offset(x: 170, y: -60)
                        .opacity(appearBackground ? 0.2 : 0)
                        .offset(y: appearBackground ? -10 : 0)
                    //.blur(radius: appearBackground ? 20 : 40)
                        .hueRotation(.degrees(viewState.width+200 / 5))
                        .allowsHitTesting(false)
                        .accessibility(hidden: true)
                )
            }
            .onAppear{
                withAnimation(.spring()) {
                    appear = true
                    
                }
                withAnimation(.easeOut(duration: 2)) {
                    appearBackground = true
                }
            }
            .onDisappear{
                withAnimation(.spring()) {
                    appear = false
                }
                withAnimation(.easeOut(duration: 1)) {
                    appearBackground = true
                }
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(Modal())
    }
}
