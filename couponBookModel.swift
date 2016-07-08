//
//  couponBookModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class couponBookModel{
    var idCouponBook: String
    var coupons: [promotionModel]
    init(r_idCouponBook:String){
        idCouponBook = r_idCouponBook
        coupons = []
    }
}