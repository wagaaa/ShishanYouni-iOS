import Alamofire
import URLImageModule
import SwiftUI


func getImg() -> Void{
    let url = "https://lion.hzau.edu.cn/app/navImgs"
    let head = HTTPHeaders(dictionaryLiteral: ("content-type","application/json"))
    let parameters = ["platform":"ipsum", "schoolID":"esselaboriseiusmod"]
    AF.request(url,method: .post, parameters: parameters, encoder: .json, headers: head).responseJSON { response in
        print(response)
    }
}
getImg()

