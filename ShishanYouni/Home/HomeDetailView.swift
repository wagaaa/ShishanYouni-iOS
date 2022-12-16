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
    @State var dest: String
    var body: some View {
        NavigationView {
            HomeWebView(destination: dest)
        }.navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        //.frame(height: 350)
    }
}

struct HomeWebView: View {
    @State var destination: String
    init(destination: String) {
        self.destination = destination
    }
    var body: some View {
        let testHTML = Bundle.main.url(forResource: "h5/"+destination, withExtension: "html")
        WebView(request: URLRequest(url: testHTML!))
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<WebView>) {
         uiView.load(request)
    }
}

//class WebViewController: UIViewController, WKNavigationDelegate {
//    var webView: WKWebView!
//    var dest: String!
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let localFilePath = Bundle.main.url(forResource: "h5/guide", withExtension: "html")!
//        webView.load(URLRequest(url: localFilePath))
//    }
//}
//
//struct WebView_UI: UIViewControllerRepresentable {
//    @State var dest: String
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let vc = WebViewController()
//        vc.dest = dest
//        return vc
//    }
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//    }
//}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView(title: "标题", dest: "guide")
    }
}
