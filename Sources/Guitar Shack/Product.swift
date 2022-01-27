//
//  Product.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 25/11/2021.
//

import Foundation

struct Product: Codable {
    let id : Int
    let description : String
    let rackspace : Int
    let minOrder : Int
    private let stock : Int
    let leadTime : Int
    
    init(_ id:Int, _ stock:Int, _ description:String, _ rackSpace:Int, _ minimumOrder:Int, _ leadTime: Int) {
        self.id = id
        self.description = description
        self.rackspace = rackSpace
        self.minOrder = minimumOrder
        self.stock = stock
        self.leadTime = leadTime
    }
    
    func needsReordering(_ quantity: Int, _ productReorderLevel: Int) -> Bool {
        return (stock - quantity) <= productReorderLevel
    }
    
    func notificationAlreadySent(_ productReorderLevel: Int) -> Bool {
        return stock <= productReorderLevel
    }
}
