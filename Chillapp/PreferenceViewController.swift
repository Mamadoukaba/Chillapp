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
import CoreLocation


class PreferenceViewController: UIViewController, CLLocationManagerDelegate{
    
    //LOCATION CODE
    
    let locationManager = CLLocationManager()
    var location: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        self.searchBar.resignFirstResponder()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
            
            if error != nil {
                println("error: " + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0
            {
                let pm = placemarks[0] as! CLPlacemark
                self.displayLocationinfo(pm)
                
            }
        })
    }
    
    
    
    func displayLocationinfo(placemark: CLPlacemark) {
    
        self.locationManager.stopUpdatingLocation()
            println(placemark.locality)
            //println(placemark.postalCode)
            println(placemark.administrativeArea)
            println(placemark.country)
            location = "\(placemark.locality) + \(placemark.postalCode) + \(placemark.administrativeArea) + \(placemark.country)"
        }
    
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }
    
    // VIEW CONTROLLER CODE
    
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
        parameters += [Parameter.near:location!]
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
        if let response = result.response {
              println(response)
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
