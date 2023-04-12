//
//  Circle.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/29.
//

import SwiftUI

struct RCircle: Decodable,Encodable,Hashable,Identifiable{
    var id:UUID = UUID()
    var name:String = ""
    var desc:String = ""
    var creator:String = ""
    var volumn:Int = 53
    
    init(name:String , creator:String){
        self.name = name
        self.creator = creator
    }
}

