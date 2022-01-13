
import Foundation

class ProductWarehouse: Warehouse {
    func getProduct(_ id: Int) -> Product? {
        let urlString = "https://6hr1390c1j.execute-api.us-east-2.amazonaws.com/default/product?id=\(id)"
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
