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
            print(error)
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
