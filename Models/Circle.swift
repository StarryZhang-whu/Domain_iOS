//
//  Circle.swift
//  domain-front-ios
//
//  Created by 韩旭 on 2023/3/29.
//

import SwiftUI

struct RCircle: Decodable,Encodable,Hashable{
    var id:Int = -1
    var name:String = ""
    var desc:String = ""
    
    init(){
        
    }
    
    init(id:Int, name:String){
        self.id = id
        self.name = name
    }
}
