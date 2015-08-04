//
//  WebviewViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 8/3/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {

    @IBOutlet weak var urlPage: UIWebView!
    var URLPath = "http://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAdressURL()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadAdressURL() {
        let requestURL = NSURL (string: URLPath)
        let request = NSURLRequest(URL: requestURL!)
        urlPage.loadRequest(request)
    }
    
    
    

}
