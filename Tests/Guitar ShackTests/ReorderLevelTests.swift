//
//  ReorderLevelTests.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 02/12/2021.
//

import Foundation
import XCTest
@testable import Guitar_Shack

class ReorderLevelTests: XCTestCase  {
    
    func testProductReorderThreshold(){
        class StubRateOfSales : RateOfSales {
            func calculate(_ productID: Int) -> Double {
                2
            }
        }
        
        let rateOfSales : RateOfSales = StubRateOfSales()
        let reorderLevel: ReorderLevel = ReorderCalculator(rateOfSales)
        let product = Product(811, 0, "", 0, 0, 5)
        
        XCTAssertEqual(reorderLevel.ofProduct(product), 10)
    }
    
}
