//
//  WebviewViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 8/3/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit
import THContactPicker
import AddressBook
import AddressBookUI

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
    
    @IBAction func contactButton(sender: UIButton) {
        var picker: ABPeoplePickerNavigationController = ABPeoplePickerNavigationController()
        picker.peoplePickerDelegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    

}

extension WebviewViewController : ABPeoplePickerNavigationControllerDelegate {
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController!, didSelectPerson person: ABRecord!) {
        
    }
}