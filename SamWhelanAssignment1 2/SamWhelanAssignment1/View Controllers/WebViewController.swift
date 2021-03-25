//
//  WebViewController.swift
//  SamWhelanAssignment1
//
//  Created by  on 2/11/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var activity: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAdress = URL(string: "https://www.google.com")
        let url = URLRequest(url: urlAdress!)
        myWebView?.load(url)
        myWebView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
