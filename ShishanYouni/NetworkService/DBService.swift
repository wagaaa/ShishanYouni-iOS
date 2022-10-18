//
//  DBService.swift
//  ShishanYouni
//
//  Created by jerry on 2022/10/12.
//

import Foundation
import RealmSwift
import SwiftyJSON


class NavImg: Object{ //定义轮播图数据库类
    @Persisted var url = ""
    @Persisted var sort = 0
    
    convenience init(url: String, sort: Int) {
        self.init()
        self.url = url
        self.sort = sort
    }
}

func imgJson2DB(_ json: JSON){  //将JSON解析并存入数据库
    let realm = try! Realm()
    let jsonArry = json.arrayValue
    //  清空数据库缓存
    try! realm.write({realm.deleteAll()})
    //  遍历JSON列表
    for items in jsonArry{
        //设定单个对象
        let img = NavImg(url: items["imgUrl"].stringValue, sort: items["sort"].intValue)
        //写入数据库
        try! realm.write {
            realm.add(img)
        }
    }
}

func getNavImginDB() -> [Int: String]{  //从数据库中读取并返回轮播图URL和位次
    let realm = try! Realm()
    //设定读取对象为NavImg
    let items = realm.objects(NavImg.self)
    var navImgs: [Int: String] = [:]
    // 遍历读取
    for item in items{
        let url = item.url
        let sort = item.sort
        navImgs.updateValue(url, forKey: sort)
    }
    print(navImgs)
    //返回数组
    return navImgs
}



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
