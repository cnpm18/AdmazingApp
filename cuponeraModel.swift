//
//  cuponeraModel.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class cuponeraModel{
    var idCuponera: String
    var cupones: [promocionModel]
    init(r_idCuponera:String){
        idCuponera = r_idCuponera
        cupones = []
    }
    func getIdCuponera () -> String{
        return self.idCuponera
    }
    func getcuponesByIndex (index: Int) -> promocionModel{
        return self.cupones[index]
    }
    func setIdCuponera (r_idCuponera: String){
        self.idCuponera = r_idCuponera
    }
}