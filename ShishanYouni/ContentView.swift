//
//  ContentView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
    var body: some View {
        TabView(selection: $selectedTab){
            CalendarView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
