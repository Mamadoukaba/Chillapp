//
//  PreferenceViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 7/20/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit
import QuadratTouch
import SwiftyJSON


class PreferenceViewController: UIViewController {
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBAction func labelChanged(sender: UISlider) {
        var sliderValue = lroundf(sender.value)
        distanceLabel.text = "\(sliderValue) mile(s)"
    }
    
    var sliderValue = 0
    var searchbar = 0
    var savedResponse = [String: AnyObject]()
    
    
    
    @IBAction func searchButton(sender: UIButton) {
        let session = Session.sharedSession()
        var parameters = [Parameter.query:searchBar.text!]
        parameters += [Parameter.near:"New York, NY"]
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
        if let response = result.response {
              //println(response)
            myJSON = JSON(response)
            self.savedResponse = response
            self.performSegueWithIdentifier("ShowPlaces", sender: self)
            
            
        
            
                }
        }
        searchTask.start()
    }
    
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as! PlacesResultViewController
            destination.results = savedResponse
    }

}

class Repository {
    
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.html_url = json["html_url"] as? String
    }
}

