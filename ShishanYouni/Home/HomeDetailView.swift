//
//  HoneDetailView.swift
//  ShishanYouni
//  WebView视图
//  Created by jerry on 2022/9/25.
//

import SwiftUI
import WebKit

struct HomeDetailView: View {
    //@State var title:String
    //@State var dest: String
    var body: some View {
        NavigationView{
                    WebView_UI()
                        //.frame(height: 200.0)
//                    Text("WxWebView").padding()
//                    WebView_UI()
//                        .frame(height: 1200.0)
//                    Text("Footer").padding()
                .navigationTitle("主页")
                }
                //.frame(height: 350)
    }
}

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // let myURL = URL(string:"https://www.apple.com")
        let url = Bundle.main.url(forResource: "/h5/index", withExtension: "html",subdirectory:"")!
        webView.load(URLRequest(url: url))
    }
}

struct WebView_UI: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = WebViewController()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView()
    }
}
