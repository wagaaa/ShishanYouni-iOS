//
//  HomeView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI

struct HomeView: View {
    //定义常量
    let homeicons: [String] = ["score", "exam", "guide", "freeroom"]
    let labels: [String] = ["成绩查询", "考试信息", "校园攻略", "空教室查询"]
    let destinations: [String] = ["score","exam","guide","index"]
    init(){
        getImgURL()
    }
    var body: some View {
        NavigationView {
            VStack() {
                //顶部轮播图
                ImageCarousel()
                    .padding(.bottom, 20)
                //List{
//                    RoundedRectangle(cornerRadius: 15)
//                        .foregroundColor(.gray)
//                        .frame(height: 220)
//                        .padding()
                //按钮网格视图
                LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]) {
                    ForEach(0 ..< 4) { index in
                        ButtonView(imagename: homeicons[index], name: labels[index], destination: destinations[index])
                            .padding(.all, 10)
                            .onTapGesture {
                        }
                    }
                    // }

                }
                //.disabled(true)
                //.scrollDisabled(true)
            }
                //令VStack置顶
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                //设置导航栏标题
                //.navigationBarTitle("主页", displayMode: .inline)
        }
    }
}

//定义单个按钮视图
struct ButtonView: View {
    //定义传递的按钮名称、图标名
    @State var imagename: String
    @State var name: String
    @State var destination: String
    var body: some View {
        //设定轻点后导航目标视图
        NavigationLink(destination: HomeDetailView(title: name, dest: destination)) {
            //按钮内容
            VStack {
                Image(imagename)
                    .resizable()
                    .frame(width: 60, height: 60)

                Text(name)
                    .font(.caption)
            }
        }
    }
}

struct buttonID: Identifiable {
    var id: UUID
    var destination: String
    var username: String
    var passwd: String

    init(id: UUID = UUID(), destination: String, username: String, passwd: String) {
        self.id = id
        self.destination = destination
        self.username = username
        self.passwd = passwd
    }
}

extension buttonID {
    static let defaults: [buttonID] = [
        buttonID(destination: "score", username: "", passwd: ""),
        buttonID(destination: "exam", username: "", passwd: "")
    ]
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
