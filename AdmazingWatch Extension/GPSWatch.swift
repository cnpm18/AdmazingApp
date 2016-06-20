//
//  GPSWatch.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 1/06/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import CoreLocation
import WatchKit

import MapKit


class GPSWatch: WKInterfaceController, CLLocationManagerDelegate {
    
    
    
    var manager:CLLocationManager!
    //var location = currentLocation(r_latitude: "",r_longitude: "")
    var r_latitude = String("none")
    var r_longitude = String("none")
    
    
    
    @IBAction func gps() {
        getLocation()
        print(r_latitude)
        print(r_longitude)
        
        pushControllerWithName("main", context: nil)

    }
    func getLocation() {
        manager = CLLocationManager()
        manager.requestAlwaysAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        
        r_latitude = String(manager.location!.coordinate.latitude)
        r_longitude = String(manager.location!.coordinate.longitude)
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        
        //userLocation - there is no need for casting, because we are now using CLLocation object
        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        
        let latDelta:CLLocationDegrees = 0.05
        
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = (manager.location?.coordinate)!
        
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    
    
    /*func saveCurrentLocation(){
        let latitude = NSKeyedArchiver.archivedDataWithRootObject(location.latitude)
        let longitude = NSKeyedArchiver.archivedDataWithRootObject(location.longitude)
        
        var encodedArray: [NSData] = [latitude, longitude]
        
        userDefaults.setObject(encodedArray, forKey: "currentLocation")
        userDefaults.synchronize()
    }
    func fillCurrentLocation(){
        
        location.setLatitude(r_latitude)
        location.setLongitude(r_longitude)
    }*/
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
