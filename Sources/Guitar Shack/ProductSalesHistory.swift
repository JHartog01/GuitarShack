//
//  ProductSalesHistory.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 13/01/2022.
//

import Foundation

class ProductSalesHistory : SalesHistory {
    let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func total(_ productID: Int, _ startDate: Date, _ endDate: Date) -> Int {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yyyy"

        if let url = URL(string: "\(baseUrl)default/sales?productId=\(productID)&startDate=\(formatter.string(from: startDate))&endDate=\(formatter.string(from: endDate))&action=total") {
            if let data = try? Data(contentsOf: url){
                if let salesTotal = try? JSONDecoder().decode(SalesTotal.self, from: data) {
                    return salesTotal.total
                }
            }
        }
        return -1
    }
}
