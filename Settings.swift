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
        
        var storeDataEncoded: [NSData] = userDefaults.objectForKey("currentLog") as! [NSData]
        
        var unpackedUserName: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[0] as NSData) as! String
        var unpackedPassword: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[1] as NSData) as! String
        
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
        
        
    }

    
    @IBAction func updatePreferences(sender: AnyObject) {
    }
}