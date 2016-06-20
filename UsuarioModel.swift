//
//  usuarioModel.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class usuarioModel{
    var idUsuario: String
    var nombreUsuario: String
    var password: String
    
    
    
    init(r_idUsuario:String, r_nombreUsuario:String, r_password:String) {
        self.idUsuario = r_idUsuario
        self.nombreUsuario = r_nombreUsuario
        self.password = r_password
    }
    func getIdUsuario() -> String{
        return self.idUsuario
    }
    func getNombreUsuario() -> String {
        return self.nombreUsuario
    }
    func getPassword() -> String {
        return self.password
    }
    func setIdUario(r_idUsuario: String){
        self.idUsuario = r_idUsuario
    }
    func setNombreUsuario(r_nombreUsuario: String){
        self.nombreUsuario = r_nombreUsuario
    }
    func setPassword(r_password: String){
        self.password = r_password
    }
    
}
