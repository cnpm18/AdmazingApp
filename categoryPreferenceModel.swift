//
//  categoryPreferenceModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 3/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class categoryPreferenceModel{
    var idCategory: String
    var nameCategory: String
    var isSelected: Bool
    
    init(r_idCategory: String, r_nameCategory:String, r_isSelected: Bool) {
        self.idCategory=r_idCategory
        self.nameCategory=r_nameCategory
        self.isSelected=r_isSelected
    }
    
    
}