//
//  ViewController.swift
//  Project4
//
//  Created by Christian James Welly on 2/12/20.
//

import UIKit
import WebKit

class ViewController: UITableViewController, WKNavigationDelegate {
    
    // MARK: Properties
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = [String]()
    let HTTPS = "https://"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView = WKWebView()
        title = "WebView"
        
        if let startWebsitesUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWebsites = try? String(contentsOf: startWebsitesUrl) {
                websites = startWebsites.components(separatedBy: "\n")
                
                let endIndex = websites.endIndex
                if websites[endIndex - 1] == "" {
                    websites.remove(at: endIndex - 1)
                }
                
            }
        }
        
        if websites.isEmpty {
            websites = ["apple.com", "hackingwithswift.com"]
        }
    }
    
    // MARK: Webkit support
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "facebook.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        let url = URL(string: HTTPS + action.title!)!
        webView.load(URLRequest(url: url))
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url: URL? = navigationAction.request.url
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        if let absString = url?.absoluteString {
            // Apple website has an about:blank being loaded for some reason...
            if absString == "about:blank" {
                decisionHandler(.allow)
                return
            }
        }

        let vc = UIAlertController(title: "Website blocked!", message: "You are not allowed to visit this site!" , preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Close", style: .cancel))
        present(vc, animated: true)
        
        decisionHandler(.cancel)
    }
    
    func setupWebview() {
        webView.navigationDelegate = self
        view = webView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let back = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [back, forward, progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    // MARK: TableView Controller
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setupWebview()
        
        guard let url = URL(string: HTTPS + websites[indexPath.row]) else {
            fatalError("URL is not well-formed")
        }
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

