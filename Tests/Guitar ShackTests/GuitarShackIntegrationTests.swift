//
//  GuitarShackIntegrationTests.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 13/01/2022.
//

import Foundation
import XCTest
@testable import Guitar_Shack

class GuitarShackIntegrationTests: XCTestCase {
    
    func testNotificationIsSent() {
        let notification: MockNotificationSender = MockNotificationSender()
        let reorderChecker: ReorderChecker = ReorderChecker(notification, ProductWarehouse(baseURL: "https://6hr1390c1j.execute-api.us-east-2.amazonaws.com/"), ReorderCalculator(ThirtyDayAverageSales(ProductSalesHistory(baseUrl: "https://gjtvhjg8e9.execute-api.us-east-2.amazonaws.com/"), StubCurrentDate())))
        reorderChecker.productSold(811, 27)
        XCTAssertFalse(notification.message.isEmpty)
    }
    
    private class StubCurrentDate: CurrentDate {
        func getDate() -> Date {
            let currentDateString = "14 Nov 2020"
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy"
            let date = formatter.date(from: currentDateString)
            return date!
        }
        
        
    }
}
