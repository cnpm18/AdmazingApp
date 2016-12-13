//
//  CouponBookedShow.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 5/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import UIKit
import Social
import WatchConnectivity

class CouponBookedShow: UIViewController , WCSessionDelegate  {
    var session : WCSession!
    
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var coupon = currentCoupon()
    var product = currentProduct()
    var closeMall=""
    
    var log = currentLog(r_userName: "",r_password: "")
    var store = storeModel(r_idStore: "", r_idCommercialArea: "", r_nameStore: "", r_email: "", r_phoneNumber: "", r_imageStore: "", r_longitude: "", r_latitude: "", r_floor: "")
    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponDescription: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var couponEndDate: UILabel!
    @IBOutlet weak var typePromotion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //---
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
        }

        //---
        
        loadCurrentCoupon()
        loadCurrentProduct()
        loadCurrentLog()
        
        
        
        let imageData = NSData(base64EncodedString: coupon.imagePromotion, options:[])
        let image = UIImage(data: imageData!)
        
        couponImage.image = image
        
        couponDescription.text=coupon.promodescription
        productDescription.text=productDescription.text!+"\r\n"+product.productDescription
        productPrice.text=productPrice.text!+product.price
        couponEndDate.text=couponEndDate.text!+coupon.endDate
        typePromotion.text=coupon.idTypePromotion
        getStoreInformation()
        closeMall=NSUserDefaults.standardUserDefaults().stringForKey("closeMall")!
        
        
    }
    override func viewDidAppear(animated: Bool) {
        shareWatch()
    }
    
    @IBAction func useCoupon(sender: AnyObject) {
        performSegueWithIdentifier("goCouponUse", sender: self)
    }
    @IBAction func deleteCouponBooked(sender: AnyObject) {
    }
    
    
    
    func loadCurrentCoupon(){
        
        var couponDataEncoded: [NSData] = userDefaults.objectForKey("currentCoupon") as! [NSData]
        
        var idPromotion: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[0] as NSData) as! String
        var idCategory: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[1] as NSData) as! String
        var idTypePromotion: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[2] as NSData) as! String
        var idStore: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[3] as NSData) as! String
        var promodescription: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[4] as NSData) as! String
        var startDate: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[5] as NSData) as! String
        var endDate: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[6] as NSData) as! String
        var imagePromotion: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[7] as NSData) as! String
        var idProduct: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[8] as NSData) as! String
        
        idPromotion=extractOptionaltoString(idPromotion)
        idCategory=extractOptionaltoString(idCategory)
        idTypePromotion=extractOptionaltoString(idTypePromotion)
        idStore=extractOptionaltoString(idStore)
        promodescription=extractOptionaltoString(promodescription)
        startDate=extractOptionaltoString(startDate)
        endDate=extractOptionaltoString(endDate)
        imagePromotion=extractOptionaltoString(imagePromotion)
        idProduct=extractOptionaltoString(idProduct)
        
        
        coupon.idPromotion=idPromotion
        coupon.idCategory=idCategory
        coupon.idTypePromotion=idTypePromotion
        coupon.idStore=idStore
        coupon.promodescription=promodescription
        coupon.startDate=startDate
        coupon.endDate=endDate
        coupon.imagePromotion=imagePromotion
        coupon.idProduct=idProduct
    }
    
    
    func loadCurrentProduct(){
        
        
        var productDataEncoded: [NSData] = userDefaults.objectForKey("currentProduct") as! [NSData]
        
        var idProduct: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[0] as NSData) as! String
        var idCategory: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[1] as NSData) as! String
        var name: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[2] as NSData) as! String
        var brand: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[3] as NSData) as! String
        var productDescription: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[4] as NSData) as! String
        var price: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[5] as NSData) as! String
        var origin: String = NSKeyedUnarchiver.unarchiveObjectWithData(productDataEncoded[6] as NSData) as! String
        
        
        idProduct=extractOptionaltoString(idProduct)
        idCategory=extractOptionaltoString(idCategory)
        name=extractOptionaltoString(name)
        brand=extractOptionaltoString(brand)
        productDescription=extractOptionaltoString(productDescription)
        price=extractOptionaltoString(price)
        origin=extractOptionaltoString(origin)
        
        
        product.idProduct=idProduct
        product.idCategory=idCategory
        product.name=name
        product.brand=brand
        product.productDescription=productDescription
        product.price=price
        product.origin=origin
        
        
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
    
    
    
    func extractOptionaltoString(string: String)->String{
        var fixedString: String
        fixedString=string.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return fixedString
        
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        performSegueWithIdentifier("goCouponBook", sender: self)
    }
    
    @IBAction func deleteCoupon(sender: AnyObject) {
        let idUser: String
        let idPromotion: String
        let response: Bool
        idUser = log.userName
        idPromotion = coupon.idPromotion
        var connection = deleteCouponConnection()
        connection.setr_idUser(idUser)
        connection.setr_idPromotion(idPromotion)
        
        connection.getResponse()
        response = connection.getResult()
        performSegueWithIdentifier("goCouponBook", sender: self)
    }
    func getStoreInformation(){
        var connection = storesByIdConnection()
        connection.setr_idStore(coupon.idStore)
        connection.getResponse()
        store=connection.getResult()
        
        
    }
    
    @IBAction func shareCouponFacebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Les invito a usar esta promoción en la aplicación Admazing! \n\n \(coupon.promodescription)  \n Disponible en la tienda \(store.nameStore) del centro comercial \(closeMall) \n Precio Original: S/.\(product.price)  \n Valido hasta: \(coupon.endDate) ")
            facebookSheet.addImage(self.couponImage.image)
            //-->store name and commercial area left
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareCouponTwitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            
            var tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetShare.setInitialText("Les invito a usar esta promoción en la aplicación Admazing! \n\n \(coupon.promodescription)")
            tweetShare.addImage(self.couponImage.image)
            
            self.presentViewController(tweetShare, animated: true, completion: nil)
            
        } else {
            
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func sendMessage(message: [String]) {
        let applicationDict = ["message":message]
        do {
            try session.updateApplicationContext(applicationDict)
        } catch {
            print("error")
        }
    }
    
     func shareWatch() {
        var data = [String]()
        data.append(self.coupon.imagePromotion)
        data.append(self.coupon.promodescription)
        data.append(self.product.productDescription)
        data.append(self.coupon.endDate)
        data.append(self.product.price)
        data.append(self.coupon.idTypePromotion)
        print (data)
        /*data[0]=coupon.imagePromotion
        data[1]=coupon.promodescription
        data[2]=product.productDescription
        data[3]=coupon.endDate
        data[4]=product.price
        data[5]=coupon.idTypePromotion*/
        sendMessage(data)
    }
}