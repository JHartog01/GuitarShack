//
//  RateOfSalesTests.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 02/12/2021.
//

import Foundation
import XCTest

@testable import Guitar_Shack

class RateOfSalesTests: XCTestCase {
    
    func testCalculatingRateOfSales() {
        class StubSalesHistory : SalesHistory {
            func total(_ productID : Int, _ startDate : Date, _ endDate : Date) -> Int {
                60
            }
        }
        
        let salesHistory: SalesHistory = StubSalesHistory()
        let rateOfSales: RateOfSales = ThirtyDayAverageSales(salesHistory, currentDate())
        
        XCTAssertEqual(rateOfSales.calculate(811), 2)
    }
    
    func testStartDateOfSalesHistoryIsCorrect() {
        let starteDateString = "12 Oct 2021"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let date = formatter.date(from: starteDateString)
        
        class MockSalesHistory: SalesHistory {
            var startDate : Date?
            func total(_ productID: Int, _ startDate: Date, _ endDate: Date) -> Int {
                self.startDate = startDate
                return 0
            }
        }
        let salesHistory = MockSalesHistory()
        
       
        let rateOfSales: RateOfSales = ThirtyDayAverageSales(salesHistory, currentDate())
        rateOfSales.calculate(811)
        
        XCTAssertEqual(salesHistory.startDate, date)
    }
    
    
    func currentDate() -> CurrentDate {
        class StubCurrentDate: CurrentDate {
            func getDate() -> Date {
                let currentDateString = "11 Nov 2021"
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM yyyy"
                let date = formatter.date(from: currentDateString)
                return date!
            }
        }
        
        return StubCurrentDate()
    }
}
