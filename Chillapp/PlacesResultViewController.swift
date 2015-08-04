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


class PlacesResultViewController: UIViewController{
    
    var repositories = [Repository]()
    var results = [String: AnyObject]() {
        didSet {
            json = JSON(results)
        }
    }
    var json: JSON?
    var selectedURL: String?

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "urlview") {
            let placesResultViewController = segue.destinationViewController as! WebviewViewController
            placesResultViewController.URLPath = selectedURL!
        }
        
    }
    
}

extension PlacesResultViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myJSON["venues"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = myJSON["venues"][indexPath.row]["name"].string
        return cell
    }
}

extension PlacesResultViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedURL = "http://foursquare.com/v/" + myJSON["venues"][indexPath.row]["id"].string!
        performSegueWithIdentifier("urlview", sender: self)
        
    }
}