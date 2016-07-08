//
//  Coupons.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 15/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class Coupons: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var tableData = [promotionModel]()
    @IBOutlet weak var couponsTable: UITableView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var coupon = currentCoupon()
    var category = currentCategory(r_currentCategoryID: "", r_currentCategoryName: "",r_currentCategoryIconName: "",r_currentCategoryIndex: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentCategory()
        if fakeSendToServer(){
            //fillArray()
            var nib = UINib(nibName: "couponCellView" , bundle: nil)
            //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.couponsTable.registerNib(nib, forCellReuseIdentifier: "coCell")
            

            
        }
        else{
            
        }
        
        
        loadCurrentCategory()
        //currentStore.removeAtIndex(currentStore.endIndex.predecessor())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func fillArray(){
        tableData.append(promocionModel(r_idPromocion: "Promo1",r_categoria: self.category.getCurrentCategoryName(),r_descripcion: "Televisor Sony 32 inchs LED solo por hoy a S/:1499"))
        tableData.append(promocionModel(r_idPromocion: "Promo2",r_categoria: self.category.getCurrentCategoryName(),r_descripcion: "Play Station 3 con juego de regalo solo por hoy a S/.899"))
        tableData.append(promocionModel(r_idPromocion: "Promo3",r_categoria: self.category.getCurrentCategoryName(),r_descripcion: "Celular LG Optimus L5 solo por hoy a S/.499"))
    }*/

    func loadCurrentCategory(){
        
        var categoryDataEncoded: [NSData] = userDefaults.objectForKey("currentCategory") as! [NSData]
        
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[0] as NSData) as! String
        var unpackediconName: String = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[1] as NSData) as! String
        var unpackedindex: Int = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[2] as NSData) as! Int
        unpackedName=unpackedName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackediconName=unpackediconName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        category.setCurrentCategoryName(unpackedName)
        category.setCurrentCategoryIconName(unpackediconName)
        category.setCurrentCategoryIndex(unpackedindex)
        
    }

    func tableView(couponsTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
        
    }
    
    
    func tableView(couponsTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Allocates a Table View Cell
        let coCell: couponCell = self.couponsTable.dequeueReusableCellWithIdentifier("coCell") as! couponCell
        // Sets the text of the Label in the Table View Cell
        self.couponsTable.rowHeight = 150
        coCell.couponDescription.text =  tableData[indexPath.row].description
        coCell.couponImage.image =  UIImage(named: tableData[indexPath.row].idPromotion)
        coCell.icon.image = UIImage(named: "icon_arrow" ) //UIImage(named: tableData[indexPath.row])
        
        
        return coCell
    }
    func tableView(couponsTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row==0{
            fillCurrentCoupon(indexPath.row)
            saveCurrentCoupon()
            performSegueWithIdentifier("goCouponShow", sender: self)
            
            //NSUserDefaults.standardUserDefaults().setObject(tableData[indexPath.row], forKey: "currentCategory")
            //performSegueWithIdentifier("goCoupons", sender: self)
            
        }
        
    }
    
    func fakeSendToServer() -> Bool{
        
        
        let currentCategoryNameFake = "Electro"
        if (category.currentCategoryName == currentCategoryNameFake){
            //server must return also the stores
            return true
        }
        else{
            return false
        }
    }
    
    func saveCurrentCoupon(){
        let encodedCcouponName = NSKeyedArchiver.archivedDataWithRootObject(coupon.getCurrentCouponName())
        let encodedCouponIconName = NSKeyedArchiver.archivedDataWithRootObject(coupon.getCurrentCouponIconName())
        let encodedCouponDescription=NSKeyedArchiver.archivedDataWithRootObject(coupon.getCurrentCouponDescription())
        let encodedCouponIndex = NSKeyedArchiver.archivedDataWithRootObject(coupon.getCurrentCouponIndex())
        
        var encodedArray: [NSData] = [encodedCcouponName, encodedCouponIconName, encodedCouponDescription, encodedCouponIndex]
        
        userDefaults.setObject(encodedArray, forKey: "currentCoupon")
        userDefaults.synchronize()
    }
    func fillCurrentCoupon(index:Int){
        coupon.setCurrentCouponName(tableData[index].idPromotion)
        coupon.setCurrentCouponIconName(tableData[index].idPromotion)
        coupon.setCurrentCouponDescription(tableData[index].description)
        coupon.setCurrentCouponIndex(index)
        
    }

    
    

    @IBAction func goBack(sender: AnyObject) {
         performSegueWithIdentifier("goCategory", sender: self)
    }
}
