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
        let client = Client(clientID:       "QOYLSJXAXYV5GEHMZAUSFUGGQX0QBWFSLRPN25PHGKBDT0LJ",
            clientSecret:   "TTCDU05B0DKBGTXI1AZSGHWQDGDLMTYFNHTHH32AHLDIHPGE",
            redirectURL:    "testapp123://foursquare")
        var configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        
        let session = Session.sharedSession()
        var parameters = [Parameter.query:"Burgers"]
        //parameters += self.location.parameters()
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                //self.venues = response["venues"] as [JSONParameters]?
                //self.tableView.reloadData()
            }
        }
        searchTask.start()
    }
}
