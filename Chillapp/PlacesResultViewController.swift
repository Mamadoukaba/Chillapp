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
    
    @IBOutlet weak var Label: UILabel!
  
 
    var repositories = [Repository]()
    var results = [String: AnyObject]() {
        didSet {
            json = JSON(results)
        }
    }
//    let venues = results["venues"] as! [[String: AnyObject]]
    var json: JSON?
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myJSON["venues"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = myJSON["venues"][indexPath.row]["categories"][0]["name"].string
        return cell
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var name = results["name"] as! [[String: AnyObject]]
    }
    
//    private func handleResponse(data: NSData) {
//        let json = JSON(data: data)
//        if let place = json["venues"][0]["place"] {
//           let description = json["categories"]["description"]
//            let details = json["icon"]["details"]
//            let placename = json["name"]["placename"]
//            cell.textlabel.text = placename
//        }
//    }
}
