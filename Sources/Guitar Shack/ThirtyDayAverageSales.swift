//
//  ThirtyDayAverageSales.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 02/12/2021.
//

import Foundation

class ThirtyDayAverageSales: RateOfSales {
    let salesHistory : SalesHistory
    
    init(_ salesHistory: SalesHistory) {
        self.salesHistory = salesHistory
    }
    
    func calculate(_ productID: Int) -> Double {
        Double(salesHistory.total(productID, Date(), Date())) / 30.0
    }
    
}
