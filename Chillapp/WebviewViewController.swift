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
import MessageUI
import SwiftyJSON


class WebviewViewController: UIViewController {

    @IBOutlet weak var urlPage: UIWebView!
    var URLPath = "http://google.com"
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        loadAdressURL()
        navigationController?.setNavigationBarHidden(false, animated: true)
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    override func viewWillAppear(animated: Bool) {
        //UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func function(string: String) -> String {
        return string + "ok"
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

extension WebviewViewController: ABPeoplePickerNavigationControllerDelegate, MFMessageComposeViewControllerDelegate {
    func peoplePickerNavigationController(peoplePicker: ABPeoplePickerNavigationController!, didSelectPerson person: ABRecord!) {
        dismissViewControllerAnimated(true) { () -> Void in
            
            if !MFMessageComposeViewController.canSendText() {
                return
            }
            
            var messageVC = MFMessageComposeViewController()
            let unmanagedPhones = ABRecordCopyValue(person, kABPersonPhoneProperty)
            let phones: ABMultiValueRef =
            Unmanaged.fromOpaque(unmanagedPhones.toOpaque()).takeUnretainedValue()
                as NSObject as ABMultiValueRef
            let unmanagedPhone = ABMultiValueCopyValueAtIndex(phones, 0)
            let phone: String = Unmanaged.fromOpaque(unmanagedPhone.toOpaque()).takeUnretainedValue() as NSObject as! String
            
            messageVC.body = selectedVenue
            messageVC.recipients = [phone]
            messageVC.messageComposeDelegate = self;
            
            self.presentViewController(messageVC, animated: false, completion: nil)
        }
        
}
    
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
            dismissViewControllerAnimated(true, completion: nil)
        }
    
}