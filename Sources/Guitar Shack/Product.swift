//
//  Product.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 25/11/2021.
//

import Foundation

class Product {
    let id : Int
    let description : String
    let rackSpace : Int
    let minimumOrder : Int
    let stock : Int
    
    init(_ id:Int, _ stock:Int, _ description:String, _ rackSpace:Int, _ minimumOrder:Int) {
        self.id = id
        self.description = description
        self.rackSpace = rackSpace
        self.minimumOrder = minimumOrder
        self.stock = stock
    }
}
