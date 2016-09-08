//
//  CouponUse.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 5/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit
import Foundation
class couponUse: UIViewController {
    var switchPreferences =  Bool(false)
    var switchAlerts =  Bool(false)
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var messageQR = ""
    var log = currentLog(r_userName: "",r_password: "")
    var coupon = currentCoupon()
    var qrcodeImage: CIImage!
    
    @IBOutlet weak var qrImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentLog()
        loadCurrentCoupon()
        
        messageQR = "Send to server Coupon with Id: \(coupon.idPromotion) and IdUser: \(log.userName)"
        //messageQR = "www.google.com"
        fillQrImage()
    }
    
    
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
        
        idPromotion = extractOptionaltoString(idPromotion)
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
    func extractOptionaltoString(string: String)->String{
        var fixedString: String
        fixedString=string.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return fixedString
        
    }


    
        
    @IBAction func usePromotion(sender: AnyObject) {
        if sendToServer(){
            
            let  alert = UIAlertController(title: "Succes", message: "La promoción fue usada con éxito", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goCouponBook", sender: self)}))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            
        }
        else{
            let  alert = UIAlertController(title: "Oh!", message: "Se produjo un error al usar esta promoción", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goCouponBookedShow", sender: self)}))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
    func sendToServer() -> Bool{
        let idUser: String
        let idPromotion: String
        let response: Bool
        idUser = log.getUserName()
        idPromotion = coupon.idPromotion
        var connection = savePromotionUseConnection()
        
        
        connection.setr_idUser(idUser)
        connection.setr_idPromotion(idPromotion)
        connection.getResponse()
        response = connection.getResult()
        return response
    }
    
    func fillQrImage() {
        
            if messageQR == "" {
                return
            }
            else{
                let data = messageQR.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
                
                let filter = CIFilter(name: "CIQRCodeGenerator")
                
                filter!.setValue(data, forKey: "inputMessage")
                filter!.setValue("Q", forKey: "inputCorrectionLevel")
                
                qrcodeImage = filter!.outputImage
                displayQRCodeImage()
            }
        
    }
    func displayQRCodeImage() {
        let scaleX = qrImageView.frame.size.width / qrcodeImage.extent.size.width
        let scaleY = qrImageView.frame.size.height / qrcodeImage.extent.size.height
        
        let transformedImage = qrcodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        qrImageView.image = UIImage(CIImage: transformedImage)
        
        
    }
        
    @IBAction func goBack(sender: AnyObject) {
        
        performSegueWithIdentifier("goCouponBook", sender: self)
    }
}

