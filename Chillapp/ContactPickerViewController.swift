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


class ContactPickerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactPickerview()
    }
    func contactPickerview() {
        let contactPickerView = THContactPickerView(frame: CGRectMake(0, 0, self.view.frame.size.width, 100))
        contactPickerView.setPlaceholderLabelText("Who would you like to message?")
        contactPickerView.delegate = self
        view.addSubview(contactPickerView)
        
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