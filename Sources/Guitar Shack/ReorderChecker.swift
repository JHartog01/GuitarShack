//
//  ReorderChecker.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 18/11/2021.
//

import Foundation

class ReorderChecker {
    var notification : NotificationSender
    var warehouse : Warehouse
    var reorderLevel : ReorderLevel
    init(_ notification : NotificationSender, _ warehouse : Warehouse, _ reorderLevel : ReorderLevel) {
        self.notification = notification
        self.warehouse = warehouse
        self.reorderLevel = reorderLevel
    }
    
    func productSold(_ id:Int, _ quantity: Int) {
        let stock = warehouse.getStock(id)
        let productReorderLevel = reorderLevel.ofProduct(id)
        if ((stock - quantity) <= productReorderLevel) && (stock > productReorderLevel) {
            notification.send("faisal")
        }
    }
}
