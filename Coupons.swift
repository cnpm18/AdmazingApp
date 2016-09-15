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
    var productData = [productModel]()
    @IBOutlet weak var couponsTable: UITableView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var coupon = currentCoupon()
    var product = currentProduct()
    var category = currentCategory(r_currentCategoryID: "", r_currentCategoryName: "",r_currentCategoryIconName: "",r_currentCategoryIndex: 0)
    
    var store = currentStore(r_currentStoreId: "", r_currentStoreName: "", r_currentStoreIconName: "", r_currentStoreLatitude: "", r_currentStoreLongitude: "", r_currentStoreFloor: "", r_currentStoreIndex: 0)
    var confirmation = false
    var  alert = UIAlertController()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentCategory()
        loadCurrentStore()
        confirmation=sendToServer()
        fillTable(confirmation)
        
            
        
        //currentStore.removeAtIndex(currentStore.endIndex.predecessor())
        
    }
    override func viewDidAppear(true: Bool) {
        if confirmation == false{
            showAlert(alert)
        }
        
        
    }
    func fillTable(confirmation:Bool){
        
        if confirmation == true{
        
            var nib = UINib(nibName: "couponCellView" , bundle: nil)
            //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.couponsTable.registerNib(nib, forCellReuseIdentifier: "coCell")
        
        
        }
        else{
            
            alert = UIAlertController(title: ":(", message: "Lo sentimos, esta categoría aún no cuenta con promociones", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goCategory", sender: self)}))
            
            
        
        
        }
    }
    
    func showAlert(alert: UIAlertController){
        self.presentViewController(alert, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadCurrentCategory(){
        
        var categoryDataEncoded: [NSData] = userDefaults.objectForKey("currentCategory") as! [NSData]
        
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[0] as NSData) as! String
        var unpackediconName: String = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[1] as NSData) as! String
        var unpackedindex: Int = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[2] as NSData) as! Int
        var unpackedId: String = NSKeyedUnarchiver.unarchiveObjectWithData(categoryDataEncoded[3] as NSData) as! String
        unpackedName=unpackedName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackediconName=unpackediconName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedId=unpackedId.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        category.setCurrentCategoryName(unpackedName)
        category.setCurrentCategoryIconName(unpackediconName)
        category.setCurrentCategoryIndex(unpackedindex)
        category.setCurrentCategoryID(unpackedId)
        
    }
    
    func loadCurrentStore(){
        
        
        var storeDataEncoded: [NSData] = userDefaults.objectForKey("currentStore") as! [NSData]
        
        var unpackedId: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[0] as NSData) as! String
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[1] as NSData) as! String
        var unpackediconName: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[2] as NSData) as! String
        var unpackedLongitude: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[3] as NSData) as! String
        var unpackedLatitude: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[4] as NSData) as! String
        var unpackedFloor: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[5] as NSData) as! String
        var unpackedindex: Int = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[6] as NSData) as! Int
        
        unpackedId=unpackedId.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        unpackedName=unpackedName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackediconName=unpackediconName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedLongitude=unpackedLongitude.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        unpackedLatitude=unpackedLatitude.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedFloor=unpackedFloor.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        store.setCurrentStoreId(unpackedId)
        store.setCurrentStoreName(unpackedName)
        store.setCurrentStoreIconName(unpackediconName)
        store.setCurrentStoreIndex(unpackedindex)
        store.currentStoreLatitude = unpackedLatitude
        store.currentStoreLongitude = unpackedLongitude
        
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
                //coCell.promoImage
        /*coCell.promoDescription.text = tableData[indexPath.row].promodescription
        coCell.productDescription.text = "Descripción del producto: "+productData[indexPath.row].productDescription
        coCell.endDate.text = "Valido hasta: "+tableData[indexPath.row].endDate
        coCell.realPrice.text = "Costo Real: S/. "+productData[indexPath.row].price
        coCell.typePromo.text = tableData[indexPath.row].idTypePromotion//for the moment
        */
        
        
        coCell.promoDescription.text = tableData[indexPath.row].promodescription
        
        let imageData = NSData(base64EncodedString: tableData[indexPath.row].imagePromotion, options:[])
        let image = UIImage(data: imageData!)
        
        coCell.promoImage.image = image
        
        return coCell
    }
    func tableView(couponsTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
            fillCurrentCoupon(indexPath.row)
            saveCurrentCoupon()
            performSegueWithIdentifier("goCouponShow", sender: self)
            
            //NSUserDefaults.standardUserDefaults().setObject(tableData[indexPath.row], forKey: "currentCategory")
            //performSegueWithIdentifier("goCoupons", sender: self)
            
        
        
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
    
    func sendToServer()->Bool{
        var idStore: String
        var idCategory: String
        
        var connection = couponsConnection()
        idStore = store.currentStoreId
        idCategory = category.currentCategoryID
        
        connection.setr_idStore(idStore)
        connection.setr_idCategory(idCategory)
        connection.getResponse()
        tableData=connection.getResult()
        productData=connection.getProducts()
        if tableData.count>0{
            return true
        }
        else{
            return false
            
        }
        
        
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
    func fillCurrentCoupon(index:Int){
        coupon.idPromotion = tableData[index].idPromotion
        coupon.idCategory = tableData[index].idCategory
        coupon.idTypePromotion = tableData[index].idTypePromotion
        coupon.idStore = tableData[index].idStore
        coupon.promodescription = tableData[index].promodescription
        coupon.startDate = tableData[index].startDate
        coupon.endDate = tableData[index].endDate
        coupon.imagePromotion = tableData[index].imagePromotion
        coupon.idProduct = tableData[index].idProduct
        

        
        product.idProduct = productData[index].idProduct
        product.idCategory = productData[index].idCategory
        product.name = productData[index].name
        product.brand = productData[index].brand
        product.productDescription = productData[index].productDescription
        product.price = productData[index].price
        product.origin = productData[index].origin
        
    }

 
 
    @IBAction func goBack(sender: AnyObject) {
        self.performSegueWithIdentifier("goCategory", sender: self)
    }

    
}
