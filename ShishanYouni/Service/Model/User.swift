//
//  User.swift
//  ShishanYouni
//
//  Created by jerry on 2022/12/5.
//

import Foundation
import RealmSwift
import SwiftyJSON


//---------------User Info DB----------------------//

class userInfo: Object{
    @Persisted var username: String
    @Persisted var passwd: String
    @Persisted var status: Bool
    
    convenience init(username: String, passwd: String, status: Bool) {
        self.init()
        self.username = username
        self.passwd = passwd
        self.status = status
    }
}

func saveUserInfo(username: String, passwd: String, status: Bool) {
    let realm = try! Realm()
    try! realm.write({realm.deleteAll()})
    
    let userInfo = userInfo(username: username, passwd: passwd, status: status)
    try! realm.write({realm.add(userInfo)})
}

func getUser() -> userInfo {
    let realm = try! Realm()
    var user = userInfo(username: "", passwd: "", status: false)
    let info = realm.objects(userInfo.self)
    for users in info{
        user.status = users.status
        user.passwd = users.passwd
        user.username = users.username
    }
    return user
}
