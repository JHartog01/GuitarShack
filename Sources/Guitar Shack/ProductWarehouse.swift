
import Foundation

class ProductWarehouse: Warehouse {
    
    private let baseURL: String
    private let network: Network
    
    init(baseURL: String, network: Network) {
        self.baseURL = baseURL
        self.network = network
    }
    
    func getProduct(_ id: Int) -> Product? {
        let urlString = "\(baseURL)default/product?id=\(id)"
        return network.fetch(urlString, responseType: Product.self)
        
    }
}
