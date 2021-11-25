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
        XCTAssertEqual(notification.message, MessageBuilder(warehouse.getProduct(811)).build())
    }
    
    func testWhenDoesntHitReorderThresholdProductDoesntNeedReordering() {
        let notification : MockNotificationSender = MockNotificationSender()
        let warehouse : Warehouse = StubWarehouse(6)
        let reorderLevel : ReorderLevel = StubReorderLevel(4)
        let reorderChecker = ReorderChecker(notification, warehouse, reorderLevel)
        
        reorderChecker.productSold(811,1)
        
        XCTAssertEqual(notification.message, "")
    }
    
    func testWhenNotificationAlreadySentProductDoesntNeedReordering() {
        let notification : MockNotificationSender = MockNotificationSender()
        let warehouse : Warehouse = StubWarehouse(4)
        let reorderLevel : ReorderLevel = StubReorderLevel(4)
        let reorderChecker =  ReorderChecker(notification, warehouse, reorderLevel)
        
        reorderChecker.productSold(811, 1)
        
        XCTAssertEqual(notification.message, "")
        
    }
    
    private class StubWarehouse: Warehouse {
        func getProduct(_ id: Int) -> Product {
            return product
        }
        
        let product: Product
        init (_ stock:Int) {
            self.product = Product(811,stock,"",0,0)
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
