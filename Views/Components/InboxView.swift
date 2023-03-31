//
//  InBox.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/29.
//

import SwiftUI

struct InboxView: View {
    @ObservedObject var todoshop:TodoShop
    @State var appear:Bool = false
    @State var appearBackground = false
    @State var viewState = CGSize.zero
    
    func dismissModal(){
        withAnimation(.spring()){
            appear = false
            appearBackground = false
            todoshop.isReceiving = false
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
    var inboxForm: some View{
        VStack(alignment: .leading){
            Text("收信箱")
                .frame(width: 70,height: 20)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading, 20.0)
                .background(Rectangle()
                    .fill(.white)
                    .frame(width: 70,height: 30)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .stroke(.red.opacity(0.7), lineWidth: 1)
                    )
                        .offset(x: 8)
                )
                .offset(x:5, y:-10)
            
            VStack {
                ForEach(todoshop.inbox) { item in
                    if(!item.received && !item.deleted){
                        InboxItem(todoshop: todoshop, locate: todoshop.inbox.firstIndex(of: item)!)
                            .padding(10)
                    }
                }
                Spacer().frame(maxHeight: 300)
            }
            .frame(minWidth:  UIScreen.main.bounds.width-40, minHeight: 300)
        }
        


        .background(Rectangle()
            .fill(.white)
            .cornerRadius(15)
            .shadow(radius:4)
            .overlay(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(.red.opacity(0.7), lineWidth: 1)
            )
        )
        .sheet(isPresented: $todoshop.isChecking){
            InboxDetailView(todoshop: todoshop, locate: todoshop.receivingAt)
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.ultraThinMaterial)
                .onTapGesture {dismissModal()}
                .opacity(appear ? 1 : 0)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                Group {
                    inboxForm
                }
                .rotationEffect(.degrees(viewState.width / 40))
                .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0), perspective: 1)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                .padding(20)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(drag)
                .frame(maxHeight: .infinity, alignment: .center)
                .offset(y: appear ? 0 : proxy.size.height)
                .background(
                    Image("Blob").offset(x: 170, y: -60)
                        .opacity(appearBackground ? 0.2 : 0)
                        .offset(y: appearBackground ? -10 : 0)
                        .blur(radius: appearBackground ? 20 : 40)
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
                withAnimation(.easeOut(duration: 2)) {
                    appearBackground = true
                }
            }
        }
    }
}
struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView(todoshop: TodoShop())
    }
}
