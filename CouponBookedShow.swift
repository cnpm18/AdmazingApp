//
//  CouponBookedShow.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 5/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import UIKit

class CouponBookedShow: UIViewController  {
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
        productDescription.text=product.productDescription
        productPrice.text=productPrice.text!+product.price
        couponEndDate.text=couponEndDate.text!+coupon.endDate
        typePromotion.text=coupon.idTypePromotion
        
        
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
        
        var storeDataEncoded: [NSData] = userDefaults.objectForKey("currentLog") as! [NSData]
        
        var unpackedUserName: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[0] as NSData) as! String
        var unpackedPassword: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[1] as NSData) as! String
        
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
    
}