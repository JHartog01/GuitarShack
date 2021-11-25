//
//  MessageBuilder.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 25/11/2021.
//

import Foundation

class MessageBuilder {
    let product : Product
    
    init(_ product: Product){
        self.product = product
    }
    
    func build() -> String {
        "Please reorder product \(product.id): "
    }
    
}
