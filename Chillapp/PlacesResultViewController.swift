//
//  PlacesResultViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 7/23/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit
import QuadratTouch
import SwiftyJSON


class PlacesResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
 
    var repositories = [Repository]()
    var results = [String: AnyObject]() {
        didSet {
            json = JSON(results)
        }
    }
    var json: JSON?
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myJSON["venues"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = myJSON["venues"][indexPath.row]["name"].string
        return cell
        
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
