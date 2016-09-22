//
//  GPS.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 4/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GPS: UIViewController, CLLocationManagerDelegate {

    
    
    var manager:CLLocationManager!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var location = currentLocation(r_latitude: "",r_longitude: "")
    var r_latitude = String("none")
    var r_longitude = String("none")
    var closeMall = String("none")
    var log = currentLog(r_userName: "",r_password: "")
    override func viewDidLoad() {
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func gps(sender: AnyObject) {
        super.viewDidLoad()
        loadCurrentLog()
        manager = CLLocationManager()
        manager.requestAlwaysAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        if manager.location != nil{
            r_latitude = String(manager.location!.coordinate.latitude)
            r_longitude = String(manager.location!.coordinate.longitude)
            
            
            closeMall = sendToServer()
            if(closeMall != ""){
                fillCurrentLocation()
                saveCurrentLocation()
                
                let  alert = UIAlertController(title: "Succes", message: "latitude: \(r_latitude), longitude: \(r_longitude), Se encuentra en el centro comercial \(closeMall)", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goMainMenu", sender: self)}))
                self.presentViewController(alert, animated: true, completion: nil)
                NSUserDefaults().setValue(closeMall, forKey: "closeMall")

                
            }
            else{
                let alert = UIAlertController(title: "Alert", message: "No se encuentra cerca a una zona comercial establecida", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }

            
        }
        else{
            let alert = UIAlertController(title: "Crash", message: "No se puede encontrar la señal de GPS", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        
        
        
        
       

    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        //userLocation - there is no need for casting, because we are now using CLLocation object
        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        
        let latDelta:CLLocationDegrees = 0.05
        
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("latitude \(manager.location?.coordinate.latitude)")
        print("longitude \(manager.location?.coordinate.longitude)")
        
        
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goHome(sender: AnyObject) {
        performSegueWithIdentifier("goHome", sender: self)

    }
    func fakeSendToServer() -> Bool{
        var fakeCloseMall = String("") //received
        
        if (r_longitude == "-0.1337" && r_latitude == "51.50998"){
            //--- must receive from server
            //---
            closeMall = fakeCloseMall
            location.latitude = r_latitude
            location.longitude = r_longitude
            return true
        }
        else{
            return false
        }
    }
    func sendToServer() -> String{//-----Real
        
        let idUser: String
        let lat: String
        let long: String
        idUser = log.userName
        lat = r_latitude
        long = r_longitude
        var connection = gpsConnection()
        
        
        connection.setr_userName(idUser)
        connection.setr_latitude(lat)
        connection.setr_longitde(long)
        connection.getResponse()
        if connection.getResult(){
            return connection.comercialArea
        }
        else{
            return ""
            
        }
    }

    @IBAction func goSettings(sender: AnyObject) {
    }
    
    
    func saveCurrentLocation(){
        let latitude = NSKeyedArchiver.archivedDataWithRootObject(location.latitude)
        let longitude = NSKeyedArchiver.archivedDataWithRootObject(location.longitude)
        
        var encodedArray: [NSData] = [latitude, longitude]
        
        userDefaults.setObject(encodedArray, forKey: "currentLocation")
        userDefaults.synchronize()
    }
    func fillCurrentLocation(){
        
        location.setLatitude(r_latitude)
        location.setLongitude(r_longitude)
    }
    func loadCurrentLog(){
        
        var logDataEncoded: [NSData] = userDefaults.objectForKey("currentLog") as! [NSData]
        
        var unpackedUserName: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[0] as NSData) as! String
        var unpackedPassword: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[1] as NSData) as! String
        
        unpackedUserName=unpackedUserName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedPassword=unpackedPassword.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        log.setUserName(unpackedUserName)
        log.setPassword(unpackedPassword)
        
        
    }

}
