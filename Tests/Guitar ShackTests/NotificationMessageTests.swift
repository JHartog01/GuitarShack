//
//  NotificationMessageTests.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 25/11/2021.
//

import Foundation
import XCTest
@testable import Guitar_Shack

class NotificationMessageTests: XCTestCase {
    var message : String = ""
    
    override func setUp() {
        let product = Product(811,0,"Epiphone Les Paul Classic In Worn Heritage Cherry Sunburst",30,20)
        let messageBuilder = MessageBuilder(product)
        message = messageBuilder.build()
    }
    
    func testMessageContainsProductId() {
        XCTAssert(message.contains("Please reorder product 811: "))
    }
    
    func testMessageContainsDescription() {
        XCTAssert(message.contains("Epiphone Les Paul Classic In Worn Heritage Cherry Sunburst, "))
    }
    
    func testMessageContainsRackSpace() {
        XCTAssert(message.contains("rack space: 30, "))
    }
    
    func testMessageContainsMinimumOrder() {
        XCTAssert(message.contains("minimum order: 20"))
    }
}
