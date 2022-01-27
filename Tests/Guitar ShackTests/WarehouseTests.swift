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
        let warehouse: Warehouse = ProductWarehouse(baseURL: "https://6hr1390c1j.execute-api.us-east-2.amazonaws.com/", network: Network())
        let product = warehouse.getProduct(811)!
        XCTAssertEqual(811, product.id)
    }
    
    func testWarehouseUrlWrong() {
        let warehouse: Warehouse = ProductWarehouse(baseURL: "https://www.google.com/", network: Network())
        XCTAssertNil(warehouse.getProduct(811))
    }
}

