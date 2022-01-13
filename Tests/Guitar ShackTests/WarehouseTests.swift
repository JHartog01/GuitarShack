//
//  WarehouseTests.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 13/01/2022.
//

import Foundation
import XCTest
@testable import Guitar_Shack

class WarehouseTests: XCTestCase {
    
    func testRetrievesCorrectProduct() {
        let warehouse: Warehouse = ProductWarehouse()
        let product = warehouse.getProduct(811)!
        XCTAssertEqual(811, product.id)
    }
}

