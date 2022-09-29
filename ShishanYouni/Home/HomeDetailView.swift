//
//  HoneDetailView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/25.
//

import SwiftUI
import WebKit
//import WKView

struct HomeDetailView: View {
    @State var dest: String
    var body: some View {
        let request: URLRequest = URLRequest(url: URL(string: ".h5/index.html/\(dest)/\(dest)")!)
        NavigationView {
            
        }
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView(dest: "exam")
    }
}
