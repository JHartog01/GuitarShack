//
//  ThirtyDayAverageSales.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 02/12/2021.
//

import Foundation
@testable import Guitar_Shack

class ThirtyDayAverageSales: RateOfSales {
    let salesHistory : SalesHistory
    let currentDate : CurrentDate
    let numberOfDays = 30
    
    
    init(_ salesHistory: SalesHistory, _ currentDate: CurrentDate) {
        self.salesHistory = salesHistory
        self.currentDate =  currentDate
    }
    
    func calculate(_ productID: Int) -> Double {
        let startDate = Calendar.current.date(byAdding: .day, value: -numberOfDays, to: currentDate.getDate())
        
        let endDate: Date = currentDate.getDate()
        return Double(salesHistory.total(productID, startDate!, endDate)) / Double(numberOfDays)
        
    }
    
}
