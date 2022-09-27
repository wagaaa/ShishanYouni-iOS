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
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
//                        .frame(height: 50)
//                        .overlay(Text("\(index)"))
                    ButtonView()
                }
            }
        }.navigationBarTitle("主页", displayMode: .inline)
        }
    }
}

struct ButtonView: View {
    @State var imagename: String = "person"
    @State var name: String = "我的"
    var body: some View {
        VStack{
            Button(action: {}){
                Image("logo")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: 40,height: 40)
            }
            Text(name)
                .font(.caption)
        }
    }
}

struct buttonID:Identifiable{
    var id: UUID
    var destination: String
    var username: String
    var passwd: String
    
    init(id: UUID=UUID(), destination: String, username: String, passwd: String) {
        self.id = id
        self.destination = destination
        self.username = username
        self.passwd = passwd
    }
}

extension buttonID{
    static let defaults: [buttonID]=[
    buttonID(destination: "score", username: "", passwd: ""),
    buttonID(destination: "exam", username: "", passwd: "")
    ]
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
