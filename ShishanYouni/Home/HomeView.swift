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
    let homeicons: [String] = ["score", "exam", "guide","freeroom"]
    let labels:[String] = ["成绩查询","考试信息","校园攻略","空教室查询"]
    var body: some View {
        NavigationView {
            VStack(){
                ACarouselView()
                    .padding(.all)
                    .frame(width: 400.0)
                LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]) {
                    ForEach(0 ..< 4) { index in
                        ButtonView(imagename: homeicons[index], name: labels[index])
                            .padding(.all, 10)
                    }
                }
                }
            .navigationBarTitle("主页", displayMode: .inline)
            .padding(.top, -200)
        }
    }
}

struct ButtonView: View {
    @State var imagename: String
    @State var name: String
    var body: some View {
        VStack{
            Button(action: {}){
                Image(imagename)
                    .resizable()
                    .frame(width: 60,height: 60)
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
