//
//  Modal.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/30.
//

import SwiftUI

class Modal: ObservableObject {
    @Published var isLogin = false
    @Published var showModal = false
    @Published var selectedModal:ModalEnum = .login
    @Published var user = User(name: "傻逼", bio: "我是一个大傻逼", avator: "https://c-ssl.duitang.com/uploads/item/202005/24/20200524124313_mNiVw.thumb.400_0.jpeg")
}

enum ModalEnum: String {
    case register
    case login
}
