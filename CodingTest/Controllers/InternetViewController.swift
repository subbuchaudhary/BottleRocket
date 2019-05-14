//
//  InternetViewController.swift
//  CodingTest
//
//  Created by Subbu Chaudhary on 5/13/19.
//  Copyright © 2019 Subbu Chaudhary. All rights reserved.
//

import UIKit
import WebKit

class InternetViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    // Web Browser navigator
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationBar()
        loadWebView()
        // Do any additional setup after loading the view.
    }

    func loadWebView() {
        let url = URL(string: Constants.kWebApi)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func customizeNavigationBar() {
        
        //MARK: - Back Button
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(named: "ic_webBack"), for: .normal)
        leftButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        leftButton.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        
        //MARK: - Reload Button
        let middleButton = UIButton(type: .custom)
        middleButton.setImage(UIImage(named: "ic_webRefresh"), for: .normal)
        middleButton.addTarget(self, action: #selector(doRefresh), for: .touchUpInside)
        middleButton.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let middleBarButton = UIBarButtonItem(customView: middleButton)
        
        //MARK: - Forward Button
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(UIImage(named: "ic_webForward"), for: .normal)
        rightButton.addTarget(self, action: #selector(forward), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        
        navigationItem.setLeftBarButtonItems([leftBarButton, middleBarButton, rightBarButton], animated: true)
        
    }
    
    //MARK: Add Actions
    @objc func back(sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func forward(sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func doRefresh(sender: UIBarButtonItem) {
        webView.reload()
    }

}
