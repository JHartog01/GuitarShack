
import Foundation

class ProductWarehouse: Warehouse {
    
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    fileprivate func fetch<T: Decodable>(_ urlString: String, responseType: T.Type) -> T? {
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
    
    func getProduct(_ id: Int) -> Product? {
        let urlString = "\(baseURL)default/product?id=\(id)"
        return fetch(urlString, responseType: Product.self)
        
    }
}
