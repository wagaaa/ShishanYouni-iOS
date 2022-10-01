//import UIKit
//import Alamofire
//
//struct ImageJson:Codable{
//    var data: [ImageData]
//}
//struct ImageData:Codable{
//    let imgUrl: String?
//    let id: String?
//    let sort: String?
//}
//
//var imagejson: ImageJson = ImageJson(data: [])
//
//let url = "https://lion.hzau.edu.cn/app/navImgs"
//let heads = HTTPHeaders(dictionaryLiteral: ("content-type", "application/json"))
//let parameter:[String:String] = ["platform": "ipsum", "schoolId": "esselaboriseiusmod"]
//
//var idata = [ImageData]()
//
//func getUrl(Imagedata: [ImageData]){
//    print(Imagedata[1].imgUrl)
//    idata = Imagedata
//    print(idata[1].imgUrl)
//    //print("run getUrl")
//}
//
//func ImageUrl() -> [ImageData]{
//    Alamofire.AF.request(url, method: .post, parameters: parameter, encoder: .json, headers: heads).responseJSON{ response in
//        do{
//            var imagejson = try JSONDecoder().decode (ImageJson.self, from: response.data!)
//            print(imagejson.data[1].imgUrl)
//            getUrl(Imagedata: imagejson.data)
//
//        }catch{
//            print(error)
//        }
//
//    }
//    return imagejson.data
//}
//
//
//func getImgUrl(){
////    AF.request(url, method: .post, parameters: parameter, encoder: .json, headers: heads).responseDecodable(of: , completionHandler: <#T##(DataResponse<Decodable, AFError>) -> Void#>)
//}
//
