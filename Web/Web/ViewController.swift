//
//  ViewController.swift
//  Web
//
//  Created by cave dwellers on 2023/08/27.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myWebView.navigationDelegate = self
        loadWebPage("http://portfolio.cavedwellers.co.kr")
    }
    
    // webview가 로딩중인 동안 indicator를 표출하기 위함
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    // webview 로딩이 끝난 경우
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // webview 로딩 중 에러가 난 경우
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }

    
    // check protocol
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        
        if !flag {
            strUrl = "http://\(strUrl)"
        }
        
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        // check protocol function
        let myUrl = checkUrl(txtUrl.text!)
        print("######... myUrl:\(myUrl)")
        txtUrl.text = ""
        
        loadWebPage(myUrl)
    }
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("https://m.blog.naver.com/juhwan5147")
    }
    @IBAction func btnGotoSite2(_ sender: UIButton) {
        loadWebPage("http://portfolio.cavedwellers.co.kr")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlStr = "<h1>HTML String </h1><p>String 변수를 이용한 웹페이지</p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlStr, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    // toolbar
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()     // webPage의 로딩을 중단시킴
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

