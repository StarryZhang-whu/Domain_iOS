//

//

import SwiftUI

struct Todo: Identifiable,Equatable,Decodable,Encodable{
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id:UUID = UUID()
    var title:String = ""
    var startDate:Date = Date()
    var endDate:Date = Date()
    var isPinned = false
    var detail:String = ""
    var circle:String = ""
    var status:Int = 0
    var isUpdate:Bool = false;
    var publisher:String = ""
    
    init(){
        
    }
    
    init(title: String, startDate:Date, endDate:Date, circle:String){
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.circle = circle
    }
    init(title: String, startDate:Date, endDate:Date, circle:String, detail:String, publisher:String){
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.circle = circle
        self.detail = detail
        self.publisher = publisher
    }
}
