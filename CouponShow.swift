//
//  CouponShow.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 24/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import UIKit

class CouponShow: UIViewController  {
    let userDefaults = NSUserDefaults.standardUserDefaults()
     var coupon = currentCoupon()
    var product = currentProduct()
    
    var log = currentLog(r_userName: "",r_password: "")
    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponDescription: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var couponEndDate: UILabel!
    @IBOutlet weak var typePromotion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
    }
    
    @IBAction func addCouponToBook(sender: AnyObject) {
        
        if sendToServer(){
            let  alert = UIAlertController(title: "Succes", message: "Esta promoción fue incluída en su cuponera!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goCoupons", sender: self)}))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            
                let  alert = UIAlertController(title: "Alert!", message: "Esta promoción ya se encuentra dentro de su cuponera!", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func sendToServer() -> Bool{
        let idUser: String
        let idPromotion: String
        let response: Bool
        idUser = log.getUserName()
        idPromotion = coupon.idPromotion
        //id = getIdFromAct()
        //pwd = getPwdFromAct()
        var connection = saveCouponConnection()
        
        
        connection.setr_idUser(idUser)
        connection.setr_idPromotion(idPromotion)
        connection.getResponse()
        response = connection.getResult()
        return response
    }

    @IBAction func goCoupons(sender: AnyObject) {
         performSegueWithIdentifier("goCoupons", sender: self)
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
    
    
    

}