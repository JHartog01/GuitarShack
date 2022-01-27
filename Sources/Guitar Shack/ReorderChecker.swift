//
//  ReorderChecker.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 18/11/2021.
//

import Foundation

class ReorderChecker {
    private var notification : NotificationSender
    private var warehouse : Warehouse
    private var reorderLevel : ReorderLevel
    init(_ notification : NotificationSender, _ warehouse : Warehouse, _ reorderLevel : ReorderLevel) {
        self.notification = notification
        self.warehouse = warehouse
        self.reorderLevel = reorderLevel
    }
    
    func productSold(_ id:Int, _ quantity: Int) {
        let product = warehouse.getProduct(id)!
        let productReorderLevel = reorderLevel.ofProduct(product)
        if (product.needsReordering(quantity, productReorderLevel)) && !(product.notificationAlreadySent(productReorderLevel)) {
            notification.send(MessageBuilder(product).build())
        }
    }
}
