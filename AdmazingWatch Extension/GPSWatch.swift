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


class GPSWatch: WKInterfaceController, CLLocationManagerDelegate{
    
    
    
    var manager:CLLocationManager!
    //var location = currentLocation(r_latitude: "",r_longitude: "")
    var r_latitude = String("none")
    var r_longitude = String("none")
    
    
    
    @IBAction func gps() {
        getLocation()
        print("latitude: \(r_latitude)")
        print("longitude: \(r_longitude)")
        
        
        pushControllerWithName("main", context: nil)
        


    }
    func showLocation(){
        
        let h0 = { print("ok")}
        
        let action1 = WKAlertAction(title: "OK", style: .Default, handler:{self.pushControllerWithName("main", context: "")})
        //let action2 = WKAlertAction(title: "Decline", style: .Destructive) {}
        let action3 = WKAlertAction(title: "Cancel", style: .Cancel) {}
        
        presentAlertControllerWithTitle("Su latitud es -16.41816 y longitud: -71.513307, usted se encuentra dentro del Mall Aventura Plaza", message: "", preferredStyle: .ActionSheet, actions: [action1,action3])
        
        
    }

    func getLocation() {
        /*manager = CLLocationManager()
        manager.requestAlwaysAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
 
        if manager.location == nil {
            r_latitude = "-16.41816"
            r_longitude = "-71.513307"
            
        }
         else{
         r_latitude = String(manager.location!.coordinate.latitude)
         r_longitude = String(manager.location!.coordinate.longitude)
         
         }
         */
        
        r_latitude = "-16.41816"
        r_longitude = "-71.513307"

        
        showLocation()
        
        
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
