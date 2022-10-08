//
//  NetworkManager.swift
//  ShishanYouni
//
//  Created by jerry on 2022/10/8.
//

import Foundation
import Moya
import Alamofire
import HandyJSON

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

    lionProvider.request(.imgurl) { result in
        switch result{
        case let .success(response):
                print(response)
        
        case .failure(_):
            print("Failed")
            break
        }
    }
}
