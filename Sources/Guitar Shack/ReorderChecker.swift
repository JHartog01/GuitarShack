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
        let product = warehouse.getProduct(id)
        let productReorderLevel = reorderLevel.ofProduct(id)
        if ((product.stock - quantity) <= productReorderLevel) && (product.stock > productReorderLevel) {
            notification.send(MessageBuilder(product).build())
        }
    }
}
