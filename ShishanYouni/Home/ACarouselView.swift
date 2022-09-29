//
//  ACrouselView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/15.
//

import SwiftUI
import ACarousel
import Alamofire


struct Item: Identifiable{
    let id = UUID()
    let image: Image
}



let roles = ["First","Second","Third"]

struct ACarouselView: View {
    
    let items:[Item] = roles.map{Item(image: Image($0))}
    var body: some View {
<<<<<<< Updated upstream
        ACarousel(items,
                  autoScroll: .active(5)
        ){ item in
            item.image
                .resizable()
                .scaledToFill()
                .frame(width:366,height:182)
                .cornerRadius(20)
=======
        HStack{
            ACarousel(items,
                      autoScroll: .active(5)
            ){ item in
//                item.image
                URLImage(url: "https://lion-1258983611.file.myqcloud.com/lion/pic/index/3.jpg")
                    //.resizable()
                    //.scaledToFill()
                    .frame(width:366,height:182)
                    .cornerRadius(20)
            }
>>>>>>> Stashed changes
        }
        .frame(height: 300)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ACarouselView()
    }
}

