//
//  BookedCouponsShow.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 27/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//


import UIKit

class BookedCouponsShow: UIViewController  {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var coupon = currentCoupon()

    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponDescription: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var couponEndDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func useCoupon(sender: AnyObject) {
     
            let  alert = UIAlertController(title: "Succes", message: "Esta promoción fue incluída en su cuponera!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goCouponShow", sender: self)}))
            self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func goBookedCoupons(sender: AnyObject) {
        self.performSegueWithIdentifier("goCouponShow", sender: self)
    }
    func loadCurrentCoupon(){
        
        var couponDataEncoded: [NSData] = userDefaults.objectForKey("currentCoupon") as! [NSData]
        
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[0] as NSData) as! String
        var unpackediconName: String = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[1] as NSData) as! String
        var unpackedindex: Int = NSKeyedUnarchiver.unarchiveObjectWithData(couponDataEncoded[2] as NSData) as! Int
        unpackedName=unpackedName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackediconName=unpackediconName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
       
        
    }

}
