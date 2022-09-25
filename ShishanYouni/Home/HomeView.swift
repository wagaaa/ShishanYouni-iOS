//
//  HomeView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI
import ACarousel



struct HomeView: View {
    let items: [Item] = roles.map { Item(image: Image($0)) }
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20){
            ACarouselView()
                .padding(.all)
                .frame(width: 400.0)
            LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]) {
                ForEach(0 ..< 12) { index in
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                        .frame(height: 50)
                        .overlay(Text("\(index)"))
                }
            }}.navigationBarTitle("主页", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
