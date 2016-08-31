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
     var tableData = [categoryModel]()
    
    
    override func viewDidLoad() {
        tableData.append(categoryModel(r_idCategory: "333", r_nameCategory: "Moda"))
        tableData.append(categoryModel(r_idCategory: "222", r_nameCategory: "Tecnologia"))
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
        
        
        return cpCell
    }
    func tableView(categoryPreferencesTable: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*
        fillCurrentCategory(indexPath.row)
        saveCurrentCategory()
        performSegueWithIdentifier("goCoupons", sender: self)*/
        
    }
    
    @IBAction func selectionDone(sender: AnyObject) {
    }

}