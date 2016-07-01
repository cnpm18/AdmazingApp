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

    //var tableData:  [String] = ["Falabella","Ripley", "Nike", "Adidas"]
    var tableData = [tiendaModel]()
    var store = currentStore(r_currentStoreName: "",r_currentStoreIconName: "",r_currentStoreIndex: 0)
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var location = currentLocation(r_latitude: "",r_longitude: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentLocation()
        if fakeSendToServer(){
            self.fillArray()
            let nib = UINib(nibName: "storeCellView" , bundle: nil)
            //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.storesTable.registerNib(nib, forCellReuseIdentifier: "cell")
        }
        
        

    }
    func fillArray(){
       tableData.append(tiendaModel(r_codigoTienda: "T001",r_nombreTienda: "Falabella"))
        tableData.append(tiendaModel(r_codigoTienda: "T002",r_nombreTienda: "Ripley"))
        tableData.append(tiendaModel(r_codigoTienda: "T003",r_nombreTienda: "Nike"))
        tableData.append(tiendaModel(r_codigoTienda: "T004",r_nombreTienda: "Adidas"))
        
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
        aCell.storeName.text =  tableData[indexPath.row].getNombretienda()
        aCell.storeLogo.image =  UIImage(named: tableData[indexPath.row].getNombretienda())
        aCell.icon.image = UIImage(named: "icon_arrow" ) //UIImage(named: tableData[indexPath.row])

        
        return aCell
    }
    func tableView(storesTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("Row \(indexPath.row) selected")
        
        if indexPath.row==0{
            fillCurrentStore(indexPath.row)
            saveCurrentStore()//NSUserDefaults.standardUserDefaults().setObject(store, forKey: "currentStore")
            performSegueWithIdentifier("goCategories", sender: self)
            
        }

    }
    func saveCurrentStore(){
        let encodedStoreName = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreName)
        let encodedStoreIconName = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreIconName)
        let encodedStoreIndex = NSKeyedArchiver.archivedDataWithRootObject(store.currentStoreIndex)
        
        var encodedArray: [NSData] = [encodedStoreName, encodedStoreIconName, encodedStoreIndex]
        
        userDefaults.setObject(encodedArray, forKey: "currentStore")
        userDefaults.synchronize()
    }
    func fillCurrentStore(index:Int){
        store.setCurrentStoreIconName(tableData[index].getNombretienda())
        store.setCurrentStoreName(tableData[index].getNombretienda())
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


    @IBAction func goHome(sender: AnyObject) {
         performSegueWithIdentifier("goHome", sender: self)
    }
    
    
    
   

}

