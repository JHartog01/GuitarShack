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
    
    var startDate: Date?
    var endDate: Date?
    
    override func setUp() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        startDate = formatter.date(from: "17 Jul 2020")
        endDate = formatter.date(from: "27 Jul 2020")
    }
    
    func testTotalSales() {
     
        
        let productSalesHistory = ProductSalesHistory(baseUrl: "https://gjtvhjg8e9.execute-api.us-east-2.amazonaws.com/", network: Network())
        XCTAssertEqual(16, productSalesHistory.total(811,startDate!,endDate!))
    }
    
    func testTotalWithWrongUrl() {
        
        let productSalesHistory = ProductSalesHistory(baseUrl: "https://google.com/", network: Network())
        XCTAssertEqual(-1, productSalesHistory.total(811, startDate!, endDate!))
        
    }
}
