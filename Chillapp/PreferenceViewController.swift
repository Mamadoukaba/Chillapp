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
import MediaPlayer


class PreferenceViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {
    
    //LOCATION CODE
    
    let locationManager = CLLocationManager()
    var location: String?
    var moviePlayer : MPMoviePlayerController?
    
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("BackgroundChillapp", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        if moviePlayer != nil {
            moviePlayer!.view.removeFromSuperview()
        }
        moviePlayer = MPMoviePlayerController(contentURL: url)
        moviePlayer!.fullscreen = true
        moviePlayer!.controlStyle = .Embedded
        if let player = moviePlayer {
//            player.view.frame = self.view.bounds
            player.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-50, view.frame.width, view.frame.height+50)
            player.prepareToPlay()
            
            player.scalingMode = .AspectFill
            self.view.insertSubview(player.view, atIndex: 0)
            moviePlayer?.repeatMode = .One
            
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        //do something
//       
        searchButton(UIButton())
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.tintColor = UIColor.clearColor()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        self.searchBar.backgroundColor = UIColor.clearColor()
        self.searchBar.delegate = self
        self.searchBar.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        var textFieldInsideSearchBar = searchBar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.blackColor()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appEnteredForeground", name: UIApplicationDidBecomeActiveNotification, object: nil)
//        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
//        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()

    }

    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func appEnteredForeground() {
        playVideo()
    }
    
//    func DismissKeyboard() {
////        self.searchBar.resignFirstResponder()
//        view.endEditing(true)
//    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
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
            println(placemark.postalCode)
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
        sliderValue = lroundf(sender.value)
        distanceLabel.text = "\(sliderValue) mile(s)"
    }
    
    var sliderValue = 0
    var searchbar = 0
    var savedResponse = [String: AnyObject]()
    
    
    
    @IBAction func searchButton(sender: UIButton) {
        sender.backgroundColor = UIColor.redColor()
        let session = Session.sharedSession()
        var parameters = [Parameter.query:searchBar.text!]
        parameters += [Parameter.near:location!]
        parameters += [Parameter.radius:"\(sliderValue * 1609)"]
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
