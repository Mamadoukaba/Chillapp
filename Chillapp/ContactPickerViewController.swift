//
//  ContactPickerViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 8/6/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit
import THContactPicker
import AddressBook
import AddressBookUI
import MessageUI

class ContactPickerViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactPickerview()
        navigationController?.setNavigationBarHidden(false, animated: true)
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    func contactPickerview() {
        let contactPickerView = THContactPickerView(frame: CGRectMake(0, 0, self.view.frame.size.width, 100))
        contactPickerView.setPlaceholderLabelText("Who would you like to message?")
        contactPickerView.delegate = self
        view.addSubview(contactPickerView)
}
    
    
 
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result:
        MessageComposeResult) {
        switch (result.value) {
        case MessageComposeResultCancelled.value:
            println("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.value:
            println("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.value:
            println("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }
    
    
}

extension ContactPickerViewController : THContactPickerDelegate {
    func contactPickerTextViewDidChange(textViewText: String!) {
        
    }
    
    func contactPickerDidRemoveContact(contact: AnyObject!) {
        
    }
    
    func contactPickerDidResize(contactPickerView: THContactPickerView!) {
    }
    
    func contactPickerTextFieldShouldReturn(textField: UITextField!) -> Bool {
        return true
    }
}
    
    
    
