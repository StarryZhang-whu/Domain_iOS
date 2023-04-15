//
//  NewsDetail.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/15.
//

import SwiftUI

struct NewsDetail: View {
    var namespace: Namespace.ID
    var course = news[0]
    var isAnimated = true
    
    @State var viewState: CGSize = .zero
    @State var showSection = false
    @State var appear = [false, false, false]
    //@State var selectedSection = courseSections[0]
    
    @EnvironmentObject var modal: Modal
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                newsBody
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appear[0] ? 0 : 30))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3))
            .modifier(OutlineModifier(cornerRadius: viewState.width / 3))
            .shadow(color: Color("Shadow").opacity(0.1), radius: 30, x: 0, y: 10)
            .scaleEffect(-viewState.width/500 + 1)
            .background(Color("Shadow").opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isAnimated ? drag : nil)
            .ignoresSafeArea()
            
            Button {
                isAnimated ?
                withAnimation(.closeCard) {
                    modal.showNewsDetail = false
                }
                : presentationMode.wrappedValue.dismiss()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
            LogoView(image: course.logo)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
                .matchedGeometryEffect(id: "logo\(course.index)", in: namespace)
                .ignoresSafeArea()
                .accessibility(hidden: true)
        }
        .zIndex(1)
        .onAppear { fadeIn() }
        .onChange(of: modal.showNewsDetail) { show in
           fadeOut()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
//            .background(
//                Image(course.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding(20)
//                    .matchedGeometryEffect(id: "image\(course.index)", in: namespace)
//                    .offset(y: scrollY > 0 ? -scrollY : 0)
//                    .accessibility(hidden: true)
//            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.index)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY > 0 ? scrollY / 10 : 0)
                    .accessibility(hidden: true)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30)
                    .matchedGeometryEffect(id: "mask\(course.index)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                Image(horizontalSizeClass == .compact ? "Waves 1" : "Waves 2")
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 500 + 1 : 1)
                    .opacity(1)
                    .matchedGeometryEffect(id: "waves\(course.index)", in: namespace)
                    .accessibility(hidden: true)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Text(course.title)
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        .matchedGeometryEffect(id: "title\(course.index)", in: namespace)
                    
                    Text(course.subtitle.uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "subtitle\(course.index)", in: namespace)
                    
                    Text(course.text)
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "description\(course.index)", in: namespace)
                    
                    Divider()
                        .foregroundColor(.secondary)
                        .opacity(appear[1] ? 1 : 0)
                    
                    HStack {
                        LogoView(image: "Logo")
                        Text("计科先锋 发表于 **湖北武汉**")
                            .font(.footnote.weight(.medium))
                            .foregroundStyle(.secondary)
                    }
                    .opacity(appear[1] ? 1 : 0)
                    .accessibilityElement(children: .combine)
                }
                .padding(20)
                .padding(.vertical, 10)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .matchedGeometryEffect(id: "blur\(course.index)", in: namespace)
                        .opacity(appear[0] ? 0 : 1)
                )
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 30)
                        .opacity(appear[0] ? 1 : 0)
                )
                .offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: 100)
                .padding(20)
            )
        }
        .frame(height: 500)
    }
    
    var newsBody:some View{
        VStack(alignment: .leading){
            Text("        金秋九月，阳光旭旭，武汉大学男篮新生杯拉开帷幕。各个参赛队伍都热情澎湃，而作为卫冕冠军的计算机学院，每一位队员都充满斗志，誓要捍卫荣耀，并最终取得四强好成绩。让我们一起来回顾一下本次新生杯计科男篮的精彩表现吧！").font(.body).bold().foregroundColor(.primary)
            Image("1").resizable().aspectRatio( contentMode: .fit).padding(10)
            Image("2").resizable().aspectRatio( contentMode: .fit).padding(10)
            Image("3").resizable().aspectRatio( contentMode: .fit).padding(10)
            Text("身法矫健向前冲，计院男篮飒英风。").padding(.leading,20).font(.headline).foregroundColor(.blue).padding(.top,20)
            Text("团队协作气如虹，输赢不负少年勇！").padding(.leading,20).font(.headline).foregroundColor(.blue).padding(.top,10)
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(20)
        .padding(.vertical, 80)
    }
//    var sectionsSection: some View {
//        VStack(spacing: 16) {
//            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
//                if index != 0 { Divider() }
//                SectionRow(section: section)
//                    .onTapGesture {
//                        showSection.toggle()
//                        selectedSection = section
//                    }
//                    .accessibilityElement(children: .combine)
//            }
//        }
//        .padding(20)
//        .background(.ultraThinMaterial)
//        .backgroundStyle(cornerRadius: 30)
//        .padding(20)
//        .padding(.vertical, 80)
//        .sheet(isPresented: $showSection) {
//            SectionView(section: $selectedSection)
//        }
//    }
    
    func close() {
        withAnimation {
            viewState = .zero
        }
        withAnimation(.closeCard.delay(0.2)) {
            modal.showNewsDetail = false
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation {
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        NewsDetail(namespace: namespace)
            .environmentObject(Modal())
    }
}
