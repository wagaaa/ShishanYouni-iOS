//
//  HoneDetailView.swift
//  ShishanYouni
//  WebView视图
//  Created by jerry on 2022/9/25.
//

import SwiftUI
import WebKit

struct HomeDetailView: View {
    @State var title:String
    @State var dest:String
    var body: some View {
        NavigationView {
            WebView(htmlFilename: "h5/\(dest)")
        }.navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        //.frame(height: 350)
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView(title: "标题",dest: "score")
    }
}
