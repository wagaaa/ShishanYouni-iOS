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
import RxCocoa

private var requestTimeOut: Double = 30

//private let myEndpointClosure = {(target: TargetType) -> Endpoint in
//    let url = target.baseURL.absoluteString + target.path
//    var task = target.task
//
//    var endpoint = Endpoint(
//        url: url,
//        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
//        method: target.method,
//        task: task,
//        httpHeaderFields: target.headers
//    )
//    requestTimeOut = 30
//
//    if let apiTarget = target as? MultiTarget,
//       let target = apiTarget.target as? API {
//        switch target {
//        case .easyRequset:
//            return endpoint
//        case .register:
//            requestTimeOut = 5
//            return endpoint
//        default:
//            return endpoint
//        }
//    }
//
//    return endpoint
//}

let responseImgUrl = "imgUrl"
let responseId = "id"
let rensonseSort = "sort"




func getimgURL() -> Void{
    let lionProvider = MoyaProvider<Lion>()
    var responses: [String: Any]?


    
    lionProvider.rx.request(.imgurl)
//        .mapObject(navImg.self)
//        .subscribe(onSuccess: { data in
//            if let imgs = data.imgs{
//                for img in imgs {
//                    if let url = img.url, let sort = img.sort{
//                        print("\(url)  \(sort)")
//                    }
//                }
//            }
//            }, onError: { error in
//                print(error)
//        })
    
    
        .mapJSON()
        .subscribe(onSuccess: { data in
            let json = data as! [String: Any]
            print(json)
        }, onError: { error in
            print(error)
        })
//        .map { data -> [[String: Any]] in
//            if let json = data as? [String:Any],
//               let imgUrls = json["ingUrl"] as? [[String: Any]]{
//                return imgUrls
//            }else{
//                return []
//            }
//        }.asObservable()
    
    //    lionProvider.request(.imgurl) { result in
    //        switch result{
    //        case let .success(response):
    //            print(response)
    //            responses = try? response.mapJSON() as! [String: Any]
    //            print(response.data)
    //            print(responses)
    //
    //        case .failure(_):
    //            print("Failed")
    //            break
    //        }
    //    }
        
    //    do{
    //        let data = try JSON(data: responses.data)
    //        let imgurls = data["imgUrl"].stringValue
    //        let sort = data["sort"].stringValue
    //        print(data)
    //    }catch{}
}


func getU() {
    var params: [String: String] = [:]
    params["platform"] = "voluptate"
    params["schoolId"] = "aliquip fugiat pariatur"
    AF.request("https://lion.hzau.edu.cn/app/navImgs", method: .post, parameters: params, encoder: .json, headers: HTTPHeaders(dictionaryLiteral: ("content-type", "application/json"))).responseJSON { response in
        switch response.result{
        case .success(let obj):
            let dic = obj as! Dictionary<String, Any>
            let urls = dic["imgUrl"] as! Array<Any>
        case .failure(let errorResult):
            print(errorResult)
            break
        }
    }
}
