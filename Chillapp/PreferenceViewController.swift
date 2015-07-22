//
//  PreferenceViewController.swift
//  Chillapp
//
//  Created by Mamadou Kaba on 7/20/15.
//  Copyright (c) 2015 Mamadou Kaba. All rights reserved.
//

import UIKit
import QuadratTouch


class PreferenceViewController: UIViewController {
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBAction func labelChanged(sender: UISlider) {
        var sliderValue = lroundf(sender.value)
        distanceLabel.text = "\(sliderValue) mile(s)"
    }
    
    var sliderValue = 0
    var searchbar = 0
    
    @IBAction func searchButton(sender: UIButton) {
        let session = Session.sharedSession()
        var parameters = [Parameter.query:searchBar.text!]
        //var location = [Parameter.radius]
        
        //parameters += self.location.parameters()
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                println(response)
                self.performSegueWithIdentifier("ShowPlaces", sender: self)
                //self.venues = response["venues"] as [JSONParameters]?
                //self.tableView.reloadData()
            }
        }
        searchTask.start()
    }
}

