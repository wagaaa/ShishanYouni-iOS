//
//  NetworkManager.swift
//  ShishanYouni
//
//  Created by jerry on 2022/10/8.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON
import RxSwift

//  获取导航栏URL并存入数据库
func getImgURL(){
    let lionProvider = MoyaProvider<Lion>()
    
    lionProvider.rx.request(.imgurl)
        .mapJSON()
        .subscribe(onSuccess: { data in
            let json = JSON(data)["data"]
            imgJson2DB(json)
            
        }, onFailure: { error in
            
        })
}

//  获取课表JSON
func getTimetable(){
    let lionProvider = MoyaProvider<Lion>()
    
    lionProvider.rx.request(.timeTable)
        .mapJSON()
        .subscribe(onSuccess: { data in
            let json = JSON(data)["data"]["timetableModels"]
            print(json)
            let arrays = json.arrayValue
            for items in arrays{
                print(items["weekList"].arrayValue)
            }
        })
}

//测试登陆
func checkAccount(username: String, passwd: String){
    let lionProvider = MoyaProvider<Lion>()
    var status: Bool = false
    
    lionProvider.rx.request(.checkAccount(username: username, passwd: passwd))
        .mapJSON()
        .subscribe(onSuccess: { data in
            let result = JSON(data)
            print(result)
            status = result["success"].rawValue as! Bool
            print(status)
            saveUserInfo(username: username, passwd: passwd, status: status)
        })
}
