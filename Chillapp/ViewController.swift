//
//  ViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 7/14/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    @IBOutlet weak var linkFacenookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //comment
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func test(sender: UIButton) {
        let login = FBSDKLoginManager()
        login.logInWithReadPermissions(["user_friends"], handler: { (result, error) -> Void in
            if error == nil {
                sender.enabled = false
                print("Logged in with result: \(result)")
            } else {
                print("There was an error logging in. Error: \(error)")
            }
        })
    }
}

