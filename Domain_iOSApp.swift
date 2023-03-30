//
//  Domain_iOSApp.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/15.
//

import SwiftUI

@main
struct Domain_iOSApp: App {
    var user = UserAuthentication()
    var modal = Modal()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
                .environmentObject(modal)
        }
    }
}
