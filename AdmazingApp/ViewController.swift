//
//  ViewController.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 2/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var psswdTextField: UITextField!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var log = currentLog(r_userName: "",r_password: "")
    var couponBook = currentCouponBook( r_currentCouponBookId: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logIn(sender: AnyObject) {
        
        let rpta = sendToServer()
        if(rpta == true){
            
            saveCurrentLog()
            performSegueWithIdentifier("goMainMenu", sender: self)
            
            
            
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Datos Incorrectos", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            self.idTextField.text = ""
            self.psswdTextField.text = ""
            
        }
    }
    
    
    func getIdFromAct()-> String{
        //NSUserDefaults.standardUserDefaults().setObject(idTextField.text!, forKey: "userAdmazing")
        //let userName = NSUserDefaults.standardUserDefaults().objectForKey("userAdmazing")
        let id: String
        id = idTextField.text!
        return id
    }
    func getPwdFromAct()-> String{
        let pwd: String
        pwd = psswdTextField.text!
        return pwd
    }
    func fakeSendToServer() -> Bool{
        let id: String
        let pwd: String
        id = getIdFromAct()
        pwd = getPwdFromAct()
        let idFake = "cnpm18"
        let pwdFake = "cnpm18CNPM18"
        let couponBookiDFake = "cnpm18_001"
        if (id == idFake && pwd == pwdFake){
            //--- must receive from server
            self.couponBook.currentCouponBookId = couponBookiDFake
            //---
            return true
        }
        else{
            return false
        }
    }
    func sendToServer() -> Bool{
        let id: String
        let pwd: String
        let response: Bool
        id = getIdFromAct()
        pwd = getPwdFromAct()
        var connection = loginConnection()
        
        
        connection.setr_userName(id)
        connection.setr_password(pwd)
        connection.getResponse()
        response = connection.getResult()
        return response
    }
    
    
    func saveCurrentLog(){
        let encodedUserId = NSKeyedArchiver.archivedDataWithRootObject(log.userName)
        let encodedPassword = NSKeyedArchiver.archivedDataWithRootObject(log.password)
        
        
        var encodedArray: [NSData] = [encodedUserId, encodedPassword]
        
        userDefaults.setObject(encodedArray, forKey: "currentLog")
        userDefaults.synchronize()
    }
    func saveCurrentCouponBook(){
        let encodedCouponBookId = NSKeyedArchiver.archivedDataWithRootObject(couponBook.currentCouponBookId)
        
        
        var encodedArray: [NSData] = [encodedCouponBookId]
        
        userDefaults.setObject(encodedArray, forKey: "currentCouponBook")
        userDefaults.synchronize()
    }
    
    
    
    
}

