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
        NavigationView {
            WebView_UI()
            
        }.navigationTitle("主页")
            .navigationBarTitleDisplayMode(.inline)
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
//        let htmlBundle = Bundle.init(path: Bundle.main.path(forResource: "h5", ofType: ".bundle")!)
//        let htmlPath = String((htmlBundle?.path(forResource: "index", ofType: ".html"))!)
//        let page = "/pages/guide/guide"
//        //guard let parsedUrl = URL(string: Bundle.main.bundlePath.absoluteString + htmlPath + page) else { return }
//        //Bundle.main.url(forResource: "/h5/index", withExtension: "html", subdirectory: "")!
//        //Bundle.main.bundleURL.appendingPathComponent(htmlPath + page)
//        let fileurl = URL(string: "file:///\(htmlPath)#\(page)")
//        webView.loadFileURL(fileurl!, allowingReadAccessTo: URL(string: Bundle.main.path(forResource: "h5", ofType: ".bundle")!)!)
        
//        let bundleOriginPath = Bundle.main.path(forResource: "dist", ofType: "bundle")
//        let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).map(\.path)[0]
//        let bundlePath = path + "/bundle"
//        let fileManager = FileManager.default
//        if !fileManager.fileExists(atPath: bundlePath) {
//            try? fileManager.createDirectory(atPath: bundlePath, withIntermediateDirectories: true, attributes: nil)
//        }
//        let targetFilePath = "\(bundlePath)/h5.bundle"
//        do {
//            try fileManager.removeItem(atPath: targetFilePath)
//        } catch {
//        } //移除目标目录下该文件
//        do {
//            try fileManager.copyItem(at: URL(fileURLWithPath: bundleOriginPath ?? ""), to: URL(fileURLWithPath: targetFilePath))
//        } catch _ {}
//
//        let htmlPath = "file:///\(targetFilePath)/index.html?#/pages/guide/guide"
//        let webView = WKWebView(frame: view.bounds)
//        let fileUrl = URL(string: htmlPath)
//        let accessUrl = URL(fileURLWithPath: targetFilePath)
//        let data = (try? Data(contentsOf: URL(string: htmlPath)!))!
        webView.load(URLRequest(url: URL(string: "https://bing.com")!))
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
