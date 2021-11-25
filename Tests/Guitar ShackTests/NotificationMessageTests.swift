//
//  NotificationMessageTests.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 25/11/2021.
//

import Foundation
import XCTest

class NotificationMessageTests: XCTestCase {
    
    func testMessageContainsProductId() {
        let product = Product(811)
        let messageBuilder = MessageBuilder(product)
        let message = messageBuilder.build()
        XCTAssert(message.contains("Please reorder product 811: "))
    }
}
