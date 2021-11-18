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
        let reorderChecker = ReorderChecker(notification)
        
        reorderChecker.productSold(811,1)
        XCTAssertEqual(notification.message, "faisal")
    }
    
    
    
    
}
