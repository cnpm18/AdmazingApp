//
//  promoViewWatch.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 21/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import CoreLocation
import WatchKit

class promoViewWatch: WKInterfaceController {
    
    
    @IBOutlet var imagePromotion: WKInterfaceImage!
    
    @IBOutlet var descriptionPromotion: WKInterfaceLabel!
    
    @IBOutlet var descriptionProduct: WKInterfaceLabel!
    
    @IBOutlet var endLineDate: WKInterfaceLabel!
    
    @IBOutlet var realCostProduct: WKInterfaceLabel!
    
    @IBOutlet var kindPromotion: WKInterfaceLabel!
    
    var tableData = [promocionModelW]()
    
    
    func fillTableData(){
        
        
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000011", r_category: "CTG006", r_description: "Maleta Spinner Vento 487 marca Saxoline con el -20% de descuento", r_kindPromotion: "20% de descuento", r_idProduct: "PD00000011", r_productDescription: "Modelo: TTMTAVEN487GR, Material: Poliéster, Color: Grafito, 4 ruedas, Sistema Spinner, Peso: 4 kg", r_costProduct: "296", r_endLineDate: "2017-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000034", r_category: "CTG009", r_description: "Smartphone Xperia Z5 Dorado con el -30% de descuento", r_kindPromotion: "30% de descuento", r_idProduct: "PD00000016", r_productDescription: "Pantalla 4,5 p, CPrincipal: 23 MP, CSecundaria: 5,1 MP, Memoria: 32 GB, SO: Android 5.1.1", r_costProduct: "3999", r_endLineDate: "2017-03-14"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000099", r_category: "CTG007", r_description: "Set Batalla en Takodana marca Lego con el -30% de descuento", r_kindPromotion: "-30% de descuento", r_idProduct: "PD00000018", r_productDescription: "Modelo: 75139,Color: variado, Edad: 4 a 6 años, Piezas: 409", r_costProduct: "529", r_endLineDate: "2017-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000059", r_category: "CTG003", r_description: "Zapatillas Mercurial X Finale con el -30% de descuento", r_kindPromotion: "30% de descuento", r_idProduct: "PD00000021", r_productDescription: "Género: Hombre,Capellada de malla,Forro textil,Entresuela de Phylon,Suela de goma que no deja marca", r_costProduct: "389", r_endLineDate: "2017-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000090", r_category: "CTG009", r_description: "Guitar Hero Aerosmith para PS3 con el -40% de descuento", r_kindPromotion: "40% de descuento", r_idProduct: "PD00000027", r_productDescription: "Modelo: P3J099, PS3,Género: Musical,Desarrollador: Neversoft,1-2 jugadores,edad: 12", r_costProduct: "79", r_endLineDate: "2017-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000073", r_category: "CTG011", r_description: "Loncherita Nuggets a 2x1", r_kindPromotion: "2x1", r_idProduct: "PD00000033", r_productDescription: "Nuggets x 4, Papas Fritas Regulares, Gaseosa medio litro y Sorpresa Infantil", r_costProduct: "15.9", r_endLineDate: "2017-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "'PR00000111'", r_category: "CTG011", r_description: "Pastillas de chocolate con el -30% de descuento", r_kindPromotion: "30% de descuento", r_idProduct: "PD00000039", r_productDescription: "Pastillas de chocolate de leche", r_costProduct: "5.9", r_endLineDate: "2016-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000102", r_category: "CTG008", r_description: "Entradas  martes y jueves a 2x1", r_kindPromotion: "2x1", r_idProduct: "PD00000041", r_productDescription: "Entradas 2D o 3D, no acumulable con otras promociones", r_costProduct: "16", r_endLineDate: "2017-07-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000175", r_category: "CTG011", r_description: "Combo Pizza Roll Huancaína con el -40% de descuento", r_kindPromotion: "40% de descuento", r_idProduct: "PD00000055", r_productDescription: "Roll de pizza con salsa Huancaína acompañado con pan al ajo y gaseosa", r_costProduct: "16.9", r_endLineDate: "2017-03-19"))
        
        tableData.append(promocionModelW(r_idPromotion: "PR00000183", r_category: "CTG011", r_description: "Mocha Frappuccino a 2x1", r_kindPromotion: "2x1", r_idProduct: "PD00000057", r_productDescription: "Batido mocha con hielo y base de café, decorado con crema batida y topping de mocha", r_costProduct: "12.9", r_endLineDate: "2017-03-14"))
        
        
        
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        fillTableData()
        
        var random: Int = 0
        random = Int(arc4random_uniform(10))
        
        self.imagePromotion.setImageNamed(tableData[random].idProduct)
        self.descriptionPromotion.setText(tableData[random].description)
        self.descriptionProduct.setText("Descripción del producto: "+tableData[random].productDescription)
        self.endLineDate.setText("Valido hasta: "+tableData[random].endLineDate)
        self.realCostProduct.setText("Costo Real: S/. "+tableData[random].costProduct)
        self.kindPromotion.setText(tableData[random].kindPromotion)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
                
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func usePromotion() {
        pushControllerWithName("QRView", context: nil)
    }
}
