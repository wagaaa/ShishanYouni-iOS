//
//  HomeWebView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/10/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlFilename: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let fileUrl = Bundle.main.url(forResource: htmlFilename, withExtension: "html") else { return }
        let request = URLRequest(url: fileUrl)
        uiView.load(request)
    }
}

