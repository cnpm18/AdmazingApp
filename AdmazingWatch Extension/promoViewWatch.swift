//
//  promoViewWatch.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 21/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import CoreLocation
import WatchKit
import WatchConnectivity

class promoViewWatch: WKInterfaceController, WCSessionDelegate {
    
    var session : WCSession!
    var coupon = currentCoupon()
    var product = currentProduct()
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override init() {
        super.init()
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    
    
    @IBOutlet var imagePromotion: WKInterfaceImage!
    
    @IBOutlet var descriptionPromotion: WKInterfaceLabel!
    
    @IBOutlet var descriptionProduct: WKInterfaceLabel!
    
    @IBOutlet var endLineDate: WKInterfaceLabel!
    
    @IBOutlet var realCostProduct: WKInterfaceLabel!
    
    @IBOutlet var kindPromotion: WKInterfaceLabel!
    
    var tableData = [promocionModelW]()
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        fillSpaces()
        
    }
    
    func fillSpaces(){
        loadCurrentCoupon()
        loadCurrentProduct()
        let imageData = NSData(base64EncodedString: coupon.imagePromotion, options:[])
        let image = UIImage(data: imageData!)
        
        
        self.imagePromotion.setImage(image)
        
        
        
        self.descriptionPromotion.setText(coupon.promodescription)
        self.descriptionProduct.setText("Descripción del producto: "+product.productDescription)
        self.endLineDate.setText("Valido hasta: "+coupon.endDate)
        self.realCostProduct.setText("Costo Real: S/. "+product.price)
        self.kindPromotion.setText(coupon.idTypePromotion)

        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
                
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func usePromotion() {
        pushControllerWithName("QRView", context: nil)
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        let data = applicationContext["message"] as? [String]
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        dispatch_async(dispatch_get_main_queue()) {
            self.coupon.idPromotion = ""
            self.coupon.idCategory = ""
            self.coupon.idTypePromotion = data![5]
            self.coupon.idStore = ""
            self.coupon.promodescription = data![1]
            self.coupon.startDate = ""
            self.coupon.endDate = data![3]
            self.coupon.imagePromotion = data![0]
            self.coupon.idProduct = ""
            
            self.product.idProduct = ""
            self.product.idCategory = ""
            self.product.name = ""
            self.product.brand = ""
            self.product.productDescription = data![2]
            self.product.price = data![4]
            self.product.origin = ""
            print("datos recibidos")
            print(data)
            self.saveCurrentCoupon()
            self.fillSpaces()
            
        }
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
    
    func saveCurrentCoupon(){
        
        
        
        
        let idPromotion = NSKeyedArchiver.archivedDataWithRootObject(coupon.idPromotion)
        let idCategory = NSKeyedArchiver.archivedDataWithRootObject(coupon.idCategory)
        let idTypePromotion = NSKeyedArchiver.archivedDataWithRootObject(coupon.idTypePromotion)
        let idStore = NSKeyedArchiver.archivedDataWithRootObject(coupon.idStore)
        let promodescription = NSKeyedArchiver.archivedDataWithRootObject(coupon.promodescription)
        let startDate = NSKeyedArchiver.archivedDataWithRootObject(coupon.startDate)
        let endDate = NSKeyedArchiver.archivedDataWithRootObject(coupon.endDate)
        let imagePromotion = NSKeyedArchiver.archivedDataWithRootObject(coupon.imagePromotion)
        let idProduct = NSKeyedArchiver.archivedDataWithRootObject(coupon.idProduct)
        
        var encodedArray: [NSData] = [idPromotion,idCategory,idTypePromotion,idStore,promodescription,startDate,endDate,imagePromotion,idProduct]
        
        userDefaults.setObject(encodedArray, forKey: "currentCoupon")
        userDefaults.synchronize()
        
        
        
        let name = NSKeyedArchiver.archivedDataWithRootObject(product.name)
        let brand = NSKeyedArchiver.archivedDataWithRootObject(product.brand)
        let productDescription = NSKeyedArchiver.archivedDataWithRootObject(product.productDescription)
        let price = NSKeyedArchiver.archivedDataWithRootObject(product.price)
        let origin = NSKeyedArchiver.archivedDataWithRootObject(product.origin)
        
        var encodedArrayProduct: [NSData] = [idProduct,idCategory,name,brand,promodescription,price,origin]
        
        userDefaults.setObject(encodedArrayProduct, forKey: "currentProduct")
        userDefaults.synchronize()
    }
    func extractOptionaltoString(string: String)->String{
        var fixedString: String
        fixedString=string.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return fixedString
        
    }
    

}
