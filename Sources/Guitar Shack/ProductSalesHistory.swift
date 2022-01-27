//
//  ProductSalesHistory.swift
//  Guitar ShackTests
//
//  Created by Younis, Faisal (F.) on 13/01/2022.
//

import Foundation

class ProductSalesHistory : SalesHistory {
    private let baseUrl: String
    private let network: Network
    
    init(baseUrl: String, network: Network) {
        self.baseUrl = baseUrl
        self.network = network
    }
    
    func total(_ productID: Int, _ startDate: Date, _ endDate: Date) -> Int {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yyyy"
        
        let urlString = "\(baseUrl)default/sales?productId=\(productID)&startDate=\(formatter.string(from: startDate))&endDate=\(formatter.string(from: endDate))&action=total"

        let salesTotal = network.fetch(urlString, responseType: SalesTotal.self)
        return salesTotal?.total ?? -1
    }
}
