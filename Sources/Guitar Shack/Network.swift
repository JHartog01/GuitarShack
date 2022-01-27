//
//  Network.swift
//  Guitar Shack
//
//  Created by Hartog, Joshua (J.A.) on 27/01/2022.
//

import Foundation

class Network {
    
    func fetch<T: Decodable>(_ urlString: String, responseType: T.Type) -> T? {
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let response = try? decoder.decode(responseType, from: data) {
                    return response
                }
            }
        }
        return nil
    }
}
