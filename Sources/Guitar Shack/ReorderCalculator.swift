//
//  ReorderCalculator.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 02/12/2021.
//

import Foundation

class ReorderCalculator: ReorderLevel {
    
    let rateOfSales : RateOfSales
    
    init(_ rateOfSales: RateOfSales ){
        self.rateOfSales = rateOfSales
        
    }
    
    func ofProduct(_ product: Product) -> Int {
        return Int((Double(product.leadTime) * rateOfSales.calculate(product.id)).rounded(.up))
            
    }
}
