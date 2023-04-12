//
//  AvatorView.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/3/31.
//

import SwiftUI

struct AvatorView: View {
    @EnvironmentObject var modal:Modal
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200")) {
            phase in
            switch phase {
            case .success(let image):
                image.resizable()
            case .empty:
                ProgressView()
            case .failure(_):
                Color.gray
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 50,height: 50)
        .cornerRadius(20)
    }
}

struct AvatorView_Previews: PreviewProvider {
    static var previews: some View {
        AvatorView()
            .environmentObject(Modal())
    }
}
