//
//  CouponBook.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 5/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

import MapKit
class CouponBook: UIViewController , UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var tableData = [promotionModel]()
    var productData = [productModel]()
    var location = currentLocation(r_latitude: "",r_longitude: "")
    @IBOutlet weak var couponsTable: UITableView!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet var storeLocationMapView: MKMapView!
    //var store = currentStore(r_currentStoreId: "", r_currentStoreName: "", r_currentStoreIconName: "", r_currentStoreLatitude: "", r_currentStoreLongitude: "", r_currentStoreFloor: "", r_currentStoreIndex: 0)
    var store = storeModel(r_idStore: "", r_idCommercialArea: "", r_nameStore: "", r_email: "", r_phoneNumber: "", r_imageStore: "", r_longitude: "", r_latitude: "", r_floor: "")
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var log = currentLog(r_userName: "",r_password: "")

    var coupon = currentCoupon()
    var product = currentProduct()
    var confirmation = false
    var  alert = UIAlertController()
    var  datealert = UIAlertController()
    var currentCell = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentLog()
        confirmation=sendToServer()
        fillTable(confirmation)
        
        currentCell = 100
        
        //currentStore.removeAtIndex(currentStore.endIndex.predecessor())
        tableData[0].endDate="2016-11-16"
        
        
    }
    override func viewDidAppear(true: Bool) {
        if confirmation == false{
            showAlert(alert)
        }
        var useAlerts  = userDefaults.boolForKey("useAlerts")
        if useAlerts==true{
            var key = searchEndDate()
            if key != 50{
                
                showAlert(datealert)
            }
        }
        
        
        
    }
    func fillTable(confirmation:Bool){
        
        if confirmation == true{
            
            var nib = UINib(nibName: "couponCellView" , bundle: nil)
            //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.couponsTable.registerNib(nib, forCellReuseIdentifier: "coCell")
            
            
        }
        else{
            
            alert = UIAlertController(title: ":(", message: "Lo sentimos, usted no cuenta con promociones de esta zona comercial en su cuponera", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.performSegueWithIdentifier("goMenu", sender: self)}))
            
            
            
            
        }
    }
    
    func showAlert(alert: UIAlertController){
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //----
    //----
    
    func loadCurrentLog(){
        
        var logDataEncoded: [NSData] = userDefaults.objectForKey("currentLog") as! [NSData]
        
        var unpackedUserName: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[0] as NSData) as! String
        var unpackedPassword: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[1] as NSData) as! String
        
        unpackedUserName=unpackedUserName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedPassword=unpackedPassword.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        log.setUserName(unpackedUserName)
        log.setPassword(unpackedPassword)
        
        
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
        
        storeLocationMapView.removeAnnotations(storeLocationMapView.annotations)
        if currentCell == indexPath.row{
            fillCurrentCoupon(indexPath.row)
            saveCurrentCoupon()
            performSegueWithIdentifier("goCouponShow", sender: self)
            
            
        }
        else{
            fillCurrentCoupon(indexPath.row)
            currentCell = indexPath.row
            getStoreInformation()
            setMapLocation()
            
        }
        
        
        
        
    }
    func searchEndDate()->Int{
        
        var year:Int
        var month:Int
        var day:Int
        var date:String
        var currentyear=0
        var currentmonth=0
        var currentday=0
        func getDate(){
            
            let date = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components([.Day , .Month , .Year], fromDate: date)
            
            let year =  components.year
            let month = components.month
            let day = components.day
            currentyear = year
            currentmonth = month
            currentday = day
           
        }
        getDate()
        
        
        for (index, promotion) in tableData.enumerate() {
            
            /*Same thing, this is going to look at each item in the people array
             and call each one 'person' within this loop*/
            
            date = promotion.endDate
            year = Int(date.substringWithRange(Range<String.Index>(start: date.startIndex.advancedBy(0), end: date.startIndex.advancedBy(4))))!
            month = Int(date.substringWithRange(Range<String.Index>(start: date.startIndex.advancedBy(5), end: date.startIndex.advancedBy(7))))!
            day = Int(date.substringWithRange(Range<String.Index>(start: date.startIndex.advancedBy(8), end: date.startIndex.advancedBy(10))))!
            
            //11/02/2016  10/02/2016
            //27/02/2016  1/03/2016
            
            var firstValue = ((currentmonth-1)*30)+currentday
            var secondValue = ((month-1)*30)+day
            var difference = secondValue-firstValue
            var differenceyears=year-currentyear
            if differenceyears>0{
                difference=difference*(-1)
            }
            if difference<=5&&(secondValue>firstValue){
                datealert = UIAlertController(title: "Alerta", message: "El cupón: \(tableData[index].promodescription) caducará en \(difference) dia(s)", preferredStyle: UIAlertControllerStyle.Alert)
                datealert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                return Int(index)
                
            }
            
            

        }
        
        return 50
    }
    
    func setMapLocation(){
        
        let longitude: CLLocationDegrees
        let latitude: CLLocationDegrees
        let storeLocation: CLLocationCoordinate2D
        if store.longitude == "" || store.latitude == "" {
            storeLocation = CLLocationCoordinate2DMake(-16.391053, -71.550520)
            latitude = -16.390553
            longitude = -71.550312
        }
        else{
            storeLocation = CLLocationCoordinate2DMake(Double(store.latitude)!, Double(store.longitude)!)
            
            
            //let latitude:CLLocationDegrees = -16.390553
            
            //let longitude:CLLocationDegrees = -71.550312
            print("--\(store.longitude)")
            print("-->\(store.latitude)")
            
            latitude = Double(store.latitude)!
            
            longitude = Double(store.longitude)!
            
            
        }
        let storePin = MKPointAnnotation()
        storePin.coordinate = storeLocation
        storePin.title = store.nameStore
        storeLocationMapView.addAnnotation(storePin)
        
        let latDelta:CLLocationDegrees = 0.005
        
        let lonDelta:CLLocationDegrees = 0.005
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        storeLocationMapView.setRegion(region, animated: false)
        
        storeLocationMapView.showsUserLocation = true
        storeLocationMapView.mapType = MKMapType(rawValue: 0)!
        storeLocationMapView.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
        
        storeLocationMapView.regionThatFits(region)
        self.floorLabel.text =  "Piso: " + store.floor
        
        
            }
    
    func getStoreInformation(){
        var connection = storesByIdConnection()
        connection.setr_idStore(coupon.idStore)
        connection.getResponse()
        store=connection.getResult()
        
        
    }
        
    func sendToServer()->Bool{
        
        var connection = couponBookRequestConnection()
        var idUser = log.getUserName()
        connection.setr_idUser(idUser)
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
    func loadCurrentLocation(){
        
        var locationDataEncoded: [NSData] = userDefaults.objectForKey("currentLocation") as! [NSData]
        
        var unpackedLatitude: String = NSKeyedUnarchiver.unarchiveObjectWithData(locationDataEncoded[0] as NSData) as! String
        var unpackedLongitude: String = NSKeyedUnarchiver.unarchiveObjectWithData(locationDataEncoded[1] as NSData) as! String
        
        unpackedLatitude=unpackedLatitude.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedLongitude=unpackedLongitude.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        
        
        location.setLatitude(unpackedLatitude)
        location.setLongitude(unpackedLongitude)
        
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
        performSegueWithIdentifier("goMenu", sender: self)
    }
}
