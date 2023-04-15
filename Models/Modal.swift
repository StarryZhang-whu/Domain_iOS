//
//  Modal.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/30.
//

import SwiftUI

class Modal: ObservableObject {
    @Published var circles: [RCircle]
    @Published var isLogin: Bool = false{
        didSet{
            UserDefaults.standard.set(isLogin, forKey: "isLogin")
        }
    }
    @Published var showModal = false
    @Published var showCircle = false
    @Published var selectedModal:ModalEnum = .login
    @Published var user = User(name: "傻逼", bio: "我是一个大傻逼", avator: "https://c-ssl.duitang.com/uploads/item/202005/24/20200524124313_mNiVw.thumb.400_0.jpeg")
    @Published var showNewsDetail = false
    init(){
        isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        circles = [
            RCircle(name: "团委学生会", creator: "赵玥"),
            RCircle(name: "计算机学院2021级全体学生", creator:"高珺"),
            RCircle(name: "IEEE Senior Members", creator: "Bo Du"),
            RCircle(name: "人工智能实验室", creator: "Turing")
        ]
    }
}

enum ModalEnum: String {
    case register
    case login
}
