//
//  CouponBook.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 27/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class CouponBook: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var categoriesTable: UITableView!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var store = currentStore(r_currentStoreName: "",r_currentStoreIconName: "",r_currentStoreIndex: 0)
    var category = currentCategory(r_currentCategoryName: "",r_currentCategoryIconName: "",r_currentCategoryIndex: 0)
    
    
    var tableData = [categoriaModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentStore()
        if fakeSendToServer(){
            self.fillArray()
            var nib = UINib(nibName: "categoryCellView" , bundle: nil)
            //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.categoriesTable.registerNib(nib, forCellReuseIdentifier: "ccell")
            
            loadCurrentStore()
            //currentStore.removeAtIndex(currentStore.endIndex.predecessor())
            
            
            // Do any additional setup after loading the view.
        }
        else{
            //---
            
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
        
    }
    func fillArray(){
        tableData.append(categoriaModel(r_idCategoria: "C001",r_nombreCategoria: "Electro"))
        tableData.append(categoriaModel(r_idCategoria: "C002",r_nombreCategoria: "Hogar"))
        tableData.append(categoriaModel(r_idCategoria: "C003",r_nombreCategoria: "Calzado"))
        
    }
    func loadCurrentStore(){
        
        var storeDataEncoded: [NSData] = userDefaults.objectForKey("currentStore") as! [NSData]
        
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[0] as NSData) as! String
        var unpackediconName: String = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[1] as NSData) as! String
        var unpackedindex: Int = NSKeyedUnarchiver.unarchiveObjectWithData(storeDataEncoded[2] as NSData) as! Int
        unpackedName=unpackedName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackediconName=unpackediconName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        store.setCurrentStoreName(unpackedName)
        store.setCurrentStoreIconName(unpackediconName)
        store.setCurrentStoreIndex(unpackedindex)
        
    }
    
    
    func tableView(categoriesTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Allocates a Table View Cell
        let cCell: categoryCell = self.categoriesTable.dequeueReusableCellWithIdentifier("ccell") as! categoryCell
        // Sets the text of the Label in the Table View Cell
        self.categoriesTable.rowHeight = 85
        cCell.categoryName.text =  tableData[indexPath.row].getNombreCategoria()
        cCell.categoryLogo.image =  UIImage(named: tableData[indexPath.row].getNombreCategoria())
        
        cCell.icon.image = UIImage(named: "icon_arrow" )
        
        
        return cCell
    }
    func tableView(categoriesTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row==0{
            fillCurrentCategory(indexPath.row)
            saveCurrentCategory()
            performSegueWithIdentifier("goCoupons", sender: self)
            
        }
        
    }
    func saveCurrentCategory(){
        let encodedCategoryName = NSKeyedArchiver.archivedDataWithRootObject(category.currentCategoryName)
        let encodedCategoryIconName = NSKeyedArchiver.archivedDataWithRootObject(category.currentCategoryIconName)
        let encodedCategoryIndex = NSKeyedArchiver.archivedDataWithRootObject(category.currentCategoryIndex)
        
        var encodedArray: [NSData] = [encodedCategoryName, encodedCategoryIconName, encodedCategoryIndex]
        
        userDefaults.setObject(encodedArray, forKey: "currentCategory")
        userDefaults.synchronize()
    }
    func fillCurrentCategory(index:Int){
        category.setCurrentCategoryIconName(tableData[index].getNombreCategoria())
        category.setCurrentCategoryName(tableData[index].getNombreCategoria())
        category.setCurrentCategoryIndex(index)
    }
    func fakeSendToServer() -> Bool{
        
        
        let currentStoreNameFake = "Falabella"
        if (store.currentStoreName == currentStoreNameFake){
            //server must return also the stores
            return true
        }
        else{
            return false
        }
    }

    
}

    