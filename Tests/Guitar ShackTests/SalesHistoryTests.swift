//
//  SalesHistoryTests.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 13/01/2022.
//

import Foundation
import XCTest

@testable import Guitar_Shack

class SalesHistoryTests: XCTestCase {
    
    func testTotalSales() {
     
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let startDate = formatter.date(from: "17 Jul 2020")
        let endDate = formatter.date(from: "27 Jul 2020")
        
        let productSalesHistory = ProductSalesHistory()
        XCTAssertEqual(16, productSalesHistory.total(811,startDate!,endDate!))
    }
}
