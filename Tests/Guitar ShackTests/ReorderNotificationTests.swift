//
//  ReorderNotificationTests.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 18/11/2021.
//

import Foundation
import XCTest
@testable import Guitar_Shack

class ReorderNotificationTests: XCTestCase {
    
    private class MockNotificationSender: NotificationSender{
        var message: String = " "
    }
    
    func testProductNeedsReordering() {
        var notification : MockNotificationSender = MockNotificationSender()
        var warehouse : Warehouse = StubWarehouse(5)
        var reorderLevel : ReorderLevel = StubReorderLevel(4)
        let reorderChecker = ReorderChecker(notification, warehouse, reorderLevel)
        
        reorderChecker.productSold(811,1)
        XCTAssertEqual(notification.message, "faisal")
    }
    
    private class StubWarehouse: Warehouse {
        let stock: Int
        init (_ stock:Int) {
            self.stock = stock
        }
    }
    
    private class StubReorderLevel: ReorderLevel {
        let reorderLevel: Int
        init (_ reorderLevel: Int) {
            self.reorderLevel = reorderLevel
        }
    }
    
    
    
    
    
}
