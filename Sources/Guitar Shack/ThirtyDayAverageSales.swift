//
//  ThirtyDayAverageSales.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 02/12/2021.
//

import Foundation

class ThirtyDayAverageSales: RateOfSales {
    private let salesHistory : SalesHistory
    private let currentDate : CurrentDate
    private let numberOfDays = 30
    
    
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
