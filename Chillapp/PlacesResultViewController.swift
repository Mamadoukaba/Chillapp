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


class PlacesResultViewController: UIViewController {
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    

    
    var repositories = [Repository]()
    var results = [String: AnyObject]() {
        didSet {
            json = JSON(results)
        }
    }
    var json: JSON?
    var selectedURL: String?
    var colors: [AnyObject]?

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
        cell.textLabel!.font = UIFont.boldSystemFontOfSize(20.0)
        cell.textLabel!.textColor = UIColor.whiteColor()
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 1 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 2 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 3 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 4 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 5 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 6 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 7 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 8 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 9 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 10 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 11 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 12 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 13 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 14 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 15 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 16 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 17 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 18 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 19 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 20 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 21 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 22 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 23 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 24 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 25 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 26 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 27 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 28 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 29 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 30 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 31 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 32 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 33 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 34 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        if indexPath.row == 35 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)
        }
        if indexPath.row == 36 {
            cell.backgroundColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.backgroundColor = UIColor(red: 0.204, green: 0.286, blue: 0.369, alpha: 1)

    }
}

extension PlacesResultViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedURL = "http://foursquare.com/v/" + myJSON["venues"][indexPath.row]["id"].string!
        selectedVenue = myJSON["venues"][indexPath.row]["location"]["formattedAddress"][0].string!
        performSegueWithIdentifier("urlview", sender: self)
        
    }
}