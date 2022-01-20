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
    
    fileprivate func needsReordering(_ product: Product, _ quantity: Int, _ productReorderLevel: Int) -> Bool {
        return (product.stock - quantity) <= productReorderLevel
    }
    
    fileprivate func notificationAlreadySent(_ product: Product, _ productReorderLevel: Int) -> Bool {
        return product.stock <= productReorderLevel
    }
    
    func productSold(_ id:Int, _ quantity: Int) {
        let product = warehouse.getProduct(id)!
        let productReorderLevel = reorderLevel.ofProduct(product)
        if (needsReordering(product, quantity, productReorderLevel)) && !(notificationAlreadySent(product, productReorderLevel)) {
            notification.send(MessageBuilder(product).build())
        }
    }
}
