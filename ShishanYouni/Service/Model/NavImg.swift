//
//  NavImg.swift
//  ShishanYouni
//
//  Created by jerry on 2022/12/5.
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
