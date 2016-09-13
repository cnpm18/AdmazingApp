//
//  Settings.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 29/08/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//
import UIKit
import Foundation
class Settings: UIViewController {
    var switchPreferences =  Bool(false)
    var switchAlerts =  Bool(false)
    let userDefaults = NSUserDefaults.standardUserDefaults()

    var log = currentLog(r_userName: "",r_password: "")
    
    @IBOutlet weak var userTextView: UILabel!
    
    @IBOutlet weak var switchPreferencesView: UISwitch!

    @IBOutlet weak var switchAletsView: UISwitch!
    
    
    func loadCurrentLog(){
        
        var logDataEncoded: [NSData] = userDefaults.objectForKey("currentLog") as! [NSData]
        
        var unpackedUserName: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[0] as NSData) as! String
        var unpackedPassword: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[1] as NSData) as! String
        
        unpackedUserName=unpackedUserName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedPassword=unpackedPassword.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        log.setUserName(unpackedUserName)
        log.setPassword(unpackedPassword)
        
        print ("loaded user \(log.userName)")
        print ("loaded pwd \(log.password)")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentLog()
        userTextView.text = userTextView.text! + " " + log.getUserName()
        
        var usePreferences  = userDefaults.boolForKey("usePreferences")
        if usePreferences == true{
            switchPreferencesView.setOn(true, animated: true)
        }
        else{
            //Nothing stored in NSUserDefaults yet. Set a value.
            switchPreferencesView.setOn(false, animated: true)
        }
        
        
    }

    
    @IBAction func usePreferences(sender: AnyObject) {
        if switchPreferencesView.on{
            userDefaults.setValue(true, forKey: "usePreferences")
                    }
        else{
            userDefaults.setValue(false, forKey: "usePreferences")
            
        }
    }
    @IBAction func updatePreferences(sender: AnyObject) {
    }
    
    
    @IBAction func updateLocation(sender: AnyObject) {
    }
}