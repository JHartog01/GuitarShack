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
    
    private class MockNotificationSender: NotificationSender {
        var message: String = ""
        func send(_ message: String) {
            self.message = message
        }
    }
    
    func testProductNeedsReordering() {
        let notification : MockNotificationSender = MockNotificationSender()
        let warehouse : Warehouse = StubWarehouse(5)
        let reorderLevel : ReorderLevel = StubReorderLevel(4)
        let reorderChecker = ReorderChecker(notification, warehouse, reorderLevel)
        
        reorderChecker.productSold(811,1)
        XCTAssertEqual(notification.message, "faisal")
    }
    
    func testWhenDoesntHitReorderThresholdProductDoesntNeedReordering() {
        let notification : MockNotificationSender = MockNotificationSender()
        let warehouse : Warehouse = StubWarehouse(6)
        let reorderLevel : ReorderLevel = StubReorderLevel(4)
        let reorderChecker = ReorderChecker(notification, warehouse, reorderLevel)
        
        reorderChecker.productSold(811,1)
        
        XCTAssertEqual(notification.message, "")
    }
    
    private class StubWarehouse: Warehouse {
        func getStock(_ id: Int) -> Int {
            return stock
        }
        
        let stock: Int
        init (_ stock:Int) {
            self.stock = stock
        }
    }
    
    private class StubReorderLevel: ReorderLevel {
        func ofProduct(_ id: Int) -> Int {
            return reorderLevel
        }
        
        let reorderLevel: Int
        init (_ reorderLevel: Int) {
            self.reorderLevel = reorderLevel
        }
    }
    
    
    
    
    
    
}
