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
        let rateOfSales: RateOfSales = ThirtyDayAverageSales(salesHistory)
        
        XCTAssertEqual(rateOfSales.calculate(811), 2)
    }
}
