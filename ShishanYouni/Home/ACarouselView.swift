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
        ACarousel(items,
                  autoScroll: .active(5)
        ){ item in
            item.image
                .resizable()
                .scaledToFill()
                .frame(width:366,height:182)
                .cornerRadius(20)
        }
        .frame(height: 300)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ACarouselView()
    }
}

