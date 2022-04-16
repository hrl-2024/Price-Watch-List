//
//  API.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import Foundation

struct API {
    
    static func getProduct(with http: String, completion: @escaping ([Product]?) -> Void) {
        
        let url = URL(string: http)!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 
                    // Get the array of product
                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 print(dataDictionary)
                 
                    // Store the movies in a property to use elsewhere
                 // TODO: verify; it should be in the records[] being sent back
                 let productDict = dataDictionary["records"] as! [[String : Any]]
                 
                 // variable to store array of movies
                 var products : [Product] = []
                 
                 // fill the movies[]
                 for dictionary in productDict {
                     let currentProduct = Product.init(dict: dictionary)
                     products.append(currentProduct)
                 }
                 
                 // return with completion, which is an escapting method which allows the data to be used outside of the closure
                 return completion(products)
             }
        }
        task.resume()
    }
}
