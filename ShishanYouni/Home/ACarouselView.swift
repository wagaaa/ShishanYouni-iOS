//
//  ACrouselView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/15.
//

import SwiftUI
import ACarousel
import Alamofire
import URLImageModule


struct Item: Identifiable{
    let id = UUID()
    let image: Image
}

//func getImg() -> Void{
//    let url = "https://lion.hzau.edu.cn/app/navImgs"
//    let head = HTTPHeaders(dictionaryLiteral: ("content-type","application-json"))
//    let parameters = ["platform":"ipsum", "schoolID":"esselaboriseiusmod"]
//    AF.request(url,method: .post, parameters: parameters, encoder: .json, headers: head).responseJSON { response in
//        <#code#>
//    }
//}


let roles = ["First","Second","Third"]

struct ACarouselView: View {
    
    let items:[Item] = roles.map{Item(image: Image($0))}
    var body: some View {
        HStack{
            ACarousel(items,
                      autoScroll: .active(5)
            ){ item in
//                item.image
                URLImage(url: "https://lion-1258983611.file.myqcloud.com/lion/pic/index/3.jpg")
                    //.resizable()
                    .scaledToFill()
                    .frame(width:366,height:182)
                    .cornerRadius(20)
            }
        }
        .frame(height: 200)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ACarouselView()
    }
}

