//
//  SalesHistory.swift
//  Guitar ShackTests
//
//  Created by Hartog, Joshua (J.A.) on 02/12/2021.
//

import Foundation

protocol SalesHistory {
    func total(_ productID : Int, _ startDate : Date, _ endDate : Date) -> Int
}
