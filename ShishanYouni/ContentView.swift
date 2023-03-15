//
//  ContentView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
//    @State private var title = ["课表","主页","我的"]
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab){
                TimetableView()
                    .tabItem {
                        Image(systemName: "calendar")
                    }.tag(1)
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(2)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(3)
            }
            .shadow(color: .gray, radius: 21)
 //           .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
