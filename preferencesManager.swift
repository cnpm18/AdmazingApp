//
//  PreferencesManager.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 30/08/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import UIKit

class PreferencesManager: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryPreferencesTable: UITableView!
    var tableData = [categoryPreferenceModel]()
    var preferences = [false,false,false,false,false,false,false,false,false,false,false,false]
    var log = currentLog(r_userName: "",r_password: "")
    let userDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        loadCurrentLog()
        sendToServer()
        for (index, element) in tableData.enumerate(){
            preferences[index]=tableData[index].isSelected
        }
        print(preferences)
        var nib = UINib(nibName: "categoryPreferencesView" , bundle: nil)
        //self.storesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.categoryPreferencesTable.registerNib(nib, forCellReuseIdentifier: "cpcell")
        
        
    }
    
    
    func tableView(categoryPreferencesTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
        
    }
    func tableView(categoryPreferencesTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        
        // Allocates a Table View Cell
        let cpCell: categoryPreferencesCell = self.categoryPreferencesTable.dequeueReusableCellWithIdentifier("cpcell") as! categoryPreferencesCell
        // Sets the text of the Label in the Table View Cell
        
        self.categoryPreferencesTable.rowHeight = 85
        cpCell.nameCategory.text =  tableData[indexPath.row].nameCategory
        cpCell.logoCategory.image =  UIImage(named: tableData[indexPath.row].nameCategory)
        
        cpCell.selectionCategory.setOn(false, animated: false)
        if preferences[indexPath.row]==true{
            cpCell.selectionCategory.setOn(true, animated: false)
        }
        else{
            cpCell.selectionCategory.setOn(false, animated: false)
            
        }
        
        
        return cpCell
    }
    func tableView(categoryPreferencesTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var myCell = categoryPreferencesTable.cellForRowAtIndexPath(indexPath) as! categoryPreferencesCell

        if preferences[indexPath.row]==true{
           preferences[indexPath.row]=false
            myCell.selectionCategory.setOn(false, animated: false)
        }
        else{
            
            if preferences[indexPath.row]==false{
                preferences[indexPath.row]=true
                myCell.selectionCategory.setOn(true, animated: false)
            }
        }
        
        
   }
    
    func loadCurrentLog(){
        
        var logDataEncoded: [NSData] = userDefaults.objectForKey("currentLog") as! [NSData]
        
        var unpackedUserName: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[0] as NSData) as! String
        var unpackedPassword: String = NSKeyedUnarchiver.unarchiveObjectWithData(logDataEncoded[1] as NSData) as! String
        
        unpackedUserName=unpackedUserName.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        unpackedPassword=unpackedPassword.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        log.setUserName(unpackedUserName)
        log.setPassword(unpackedPassword)
        
        print ("loaded user \(log.userName)")
        print ("loaded pwd \(log.password)")
        
        
    }
    
    func sendToServer()->Bool{
        
        var connection = getAllPreferedCategoriesConnection()
        connection.setr_idUser(log.userName)
        connection.getResponse()
        tableData=connection.getResult()
        if tableData.count>0{
            return true
        }
        else{
            return false
            
        }
    }
    
    
    @IBAction func managePreferences(sender: AnyObject) {
        
        for (index, element) in tableData.enumerate() {
            if preferences[index]==true{
                var connection = savePreferencesConnection()
                connection.setr_userName(log.userName)
                connection.setr_idCategory(tableData[index].idCategory)
                connection.getResponse()
                var result = connection.getResult()
                print("resultado save \(index) = \(result)")
                
            }
            else{
                if preferences[index]==false{
                    var connection = deletePreferencesConnection()
                    connection.setr_userName(log.userName)
                    connection.setr_idCategory(tableData[index].idCategory)
                    connection.getResponse()
                    var result = connection.getResult()
                    print("resultado delete\(index) = \(result)")
                
                }
                
                //implement delete
            }
            
            
        }
        print(preferences)
        performSegueWithIdentifier("goSettings", sender: self)
        
    }
    
}