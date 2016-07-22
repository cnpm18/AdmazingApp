//
//  QRView.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 20/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
import CoreLocation
import WatchKit

class QRView: WKInterfaceController {

    @IBOutlet var qrCode: WKInterfaceImage!
    
    @IBAction func acceptButton() {
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        var random: Int = 0
        random = Int(arc4random_uniform(5))
        
        if random == 0{
            self.qrCode.setImageNamed("qr1")
            print("qr1")
        }
        if random == 1{
            self.qrCode.setImageNamed("qr2")
            print("qr2")
        }
        if random == 2{
            self.qrCode.setImageNamed("qr3")
            print("qr3")
        }
        if random == 3{
            self.qrCode.setImageNamed("qr4")
            print("qr4")
        }
        if random == 4{
            self.qrCode.setImageNamed("qr5")
            print("qr5")
        }
        
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
