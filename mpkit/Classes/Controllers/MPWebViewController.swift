//
//  MPWebViewController.swift
//  mpkit
//
//  Created by Martin Prot on 14/03/2018.
//

import Foundation
import WebKit

public class MPWebViewController: UIViewController {
	
	public convenience init(url: String, loadImmediately: Bool = false) {
		self.init()
		self.url = url
		
		if loadImmediately {
			self.loadViewIfNeeded()
		}
	}
	
	@IBInspectable private var url: String = ""
	
	@IBOutlet private var webViewContainer: UIView?
	@IBOutlet private var activity: UIActivityIndicatorView?
	private var webView: WKWebView?
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let container = self.webViewContainer ?? self.view else { return }
		let webView = WKWebView(frame: container.bounds)
		webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		container.addSubview(webView)
		
		if let url = URL(string: self.url) {
			// Do any additional setup after loading the view.
			webView.load(URLRequest(url: url))
			webView.navigationDelegate = self
		}
		self.webView = webView
		
		if self.activity == nil {
			let activity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
			activity.center = (self.view.bounds.size / 2).toPoint
			activity.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin,
										 .flexibleRightMargin, .flexibleLeftMargin]
			self.view.addSubview(activity)
			activity.startAnimating()
			self.activity = activity
		}
	}
}

extension MPWebViewController: WKNavigationDelegate {
	public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
		self.activity?.startAnimating()
	}
	
	public func webView(_ webView: WKWebView, didFail navigation: WKNavigation, withError error: Error) {
		self.activity?.stopAnimating()
	}
	
	public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
		self.activity?.stopAnimating()
	}
}

