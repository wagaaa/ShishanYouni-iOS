//
//  DBService.swift
//  ShishanYouni
//
//  Created by jerry on 2022/10/12.
//

import Foundation
import RealmSwift
import SwiftyJSON





//----------Timetable DB--------------//

class TimeTable: Object{
    @Persisted var name = ""
    @Persisted var room = ""
    @Persisted var teacher = ""
    
    @Persisted var start = 0
    @Persisted var step = 0
    @Persisted var weeks = List<Int>()
    @Persisted var day = 0
    @Persisted var colornum = 0
    
    convenience init(name: String, room: String, teacher: String, start: Int, step: Int, weeks: List<Int>, day: Int, colornum: Int) {
        self.init()
        self.name = name
        self.room = room
        self.teacher = teacher
        self.start = start
        self.step = step
        self.weeks = weeks
        self.day = day
        self.colornum = colornum
    }
}


func timeJson2Db(_ json: JSON) {
    let realm = try! Realm()
    let jsonArry = json.arrayValue
    
    try! realm.write({realm.deleteAll()})
    
    for items in jsonArry{
        let weeklist = List<Int>()
        let weekArray = items["weekList"].arrayValue
        for i in try! Array<Int>(from: items["weekList"].arrayValue as! Decoder){
            weeklist.append(i)
        }
        let classes = TimeTable(name: items["name"].stringValue, room: items["room"].stringValue, teacher: items["teacher"].stringValue, start: items["start"].intValue, step: items["step"].intValue, weeks: weeklist, day: items["day"].intValue, colornum: items["colorRandom"].intValue)
    }
}


