
import Foundation

class ProductWarehouse: Warehouse {
    
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    func getProduct(_ id: Int) -> Product? {
        let urlString = "\(baseURL)default/product?id=\(id)"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let product = try? decoder.decode(Product.self, from: data) {
                    return product
                }
                    
            }
        }
        return nil
    }
}
