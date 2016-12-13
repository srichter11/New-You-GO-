//
//  WebViewController.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/11/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://www.youtube.com/watch?v=pnXiy4D_I8g");
        let requestObj = NSURLRequest(url: url! as URL)
        webView.loadRequest(requestObj as URLRequest)

        // This code doesn't work yet- need to fix
        
        func showActivityIndicator(uiView: UIView) {
            let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
            actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            actInd.center = uiView.center
            actInd.hidesWhenStopped = true
            actInd.activityIndicatorViewStyle =
                UIActivityIndicatorViewStyle.whiteLarge
            uiView.addSubview(actInd)
            
            actInd.startAnimating()
        }
        
        
    }

    }
