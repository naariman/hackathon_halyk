    
import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: config)
        webView.backgroundColor = .white
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        if let url = URL(string: "https://halyklife1.tilda.ws/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
