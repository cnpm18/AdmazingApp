//
//  Stores.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 11/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class Stores: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var storesTable: UITableView!

    
    var tableData = [storeModel]()
    var store = currentStore(r_currentStoreId: "", r_currentStoreName: "",r_currentStoreIconName: "",r_currentStoreIndex: 0)
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var location = currentLocation(r_latitude: "",r_longitude: "")
    var log = currentLog(r_userName: "",r_password: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentLog()
        loadCurrentLocation()
        if sendToServer(){
            let nib = UINib(nibName: "storeCellView" , bundle: nil)
            //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.storesTable.registerNib(nib, forCellReuseIdentifier: "cell")
        }
        
        

    }
            

    func tableView(storesTable: UITableView, numberOfRowsInSection section:
        Int) -> Int
    {
        return self.tableData.count
    }
    func tableView(storesTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Allocates a Table View Cell
        let aCell: storeCell = self.storesTable.dequeueReusableCellWithIdentifier("cell") as! storeCell
        // Sets the text of the Label in the Table View Cell
        
        self.storesTable.rowHeight = 85
        aCell.storeName.text =  tableData[indexPath.row].nameStore
        
        aCell.icon.image = UIImage(named: "icon_arrow" ) //UIImage(named: tableData[indexPath.row])
        
        let imageData = NSData(base64EncodedString: tableData[indexPath.row].imageStore, options:[])
        let image = UIImage(data: imageData!)
        
        aCell.storeLogo.image = image


        
        return aCell
    }
    func tableView(storesTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("Row \(indexPath.row) selected")
        
            fillCurrentStore(indexPath.row)
        print(indexPath.row)
            saveCurrentStore()//NSUserDefaults.standardUserDefaults().setObject(store, forKey: "currentStore")
            performSegueWithIdentifier("goCategories", sender: self)
            
        

    }
    func saveCurrentStore(){
        let encodedStoreId = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreId)
        let encodedStoreName = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreName)
        let encodedStoreIconName = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreIconName)
        let encodedStoreIndex = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreIndex)
        
        var encodedArray: [NSData] = [encodedStoreId, encodedStoreName, encodedStoreIconName, encodedStoreIndex]
        
        userDefaults.setObject(encodedArray, forKey: "currentStore")
        userDefaults.synchronize()
        
    }
    func fillCurrentStore(index:Int){
        store.setCurrentStoreId(tableData[index].idStore)
        store.setCurrentStoreIconName(tableData[index].nameStore)
        store.setCurrentStoreName(tableData[index].nameStore)
        store.setCurrentStoreIndex(index)
        
    }
    func tableView(storesTable: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
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
    func fakeSendToServer() -> Bool{
        
       
        let latitudeFake = "51.50998"
        let longitudeFake = "-0.1337"
        let couponBookiDFake = "cnpm18_001"
        if (location.latitude == latitudeFake && location.longitude == longitudeFake){
            //server must return also the stores
            return true
        }
        else{
            return false
        }
    }
    func sendToServer()->Bool{
        let idUser: String
        let lat: String
        let long: String
        idUser = log.userName
        var connection = storesConnection()
        
        
        connection.setr_userName(idUser)
        connection.getResponse()
        tableData=connection.getResult()
        if tableData.count>0{
            return true
        }
        else{
            return false
            
        }
        

    }


    @IBAction func goHome(sender: AnyObject) {
         performSegueWithIdentifier("goHome", sender: self)
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

    
    
    
   

}

