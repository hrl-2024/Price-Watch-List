//
//  API.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import Foundation

struct API {
    
    static func getProduct(ofType type: String, completion: @escaping ([Product]?) -> Void) {

        let headers = [
          "Accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqa2N3ZTl4ODJnMG1ic3QwZno5Z3J2aHppeGVveWdlbSIsImlzcyI6ImRhdGFmaW5pdGkuY28ifQ.qtuzTRaGqyDGKL7L6E0u7ihgOHjOgIqqVHY8OHcMiew6XY5s_FrD2NzbuJgSTRyj5-htOVqW7dj230cOondgc9Xs0umFnoqXWKHhPHiQdPkwaOJ9VrFnKirvyLWN5FWIYKVcvVrhbwRFc2xjIRd4Pa9gYUqNpGIA9FSkW6a2HE2yM6W2RsgqY7Vk96KJFwpuRSq0-NtN-cq_y6hEHjXSZBZJboqfs93E5Txh8jedN8vhSILAftKsv_3uDbMokyrtZtkEUezDL32mfqs2VRkmdpltD2mtBvsgxA7uzUkE1ea2nzpqfaUbSR2PJ4hIHfI5H6qnrD0YMqs68sD_n4TmL9cHgDan96ekv4sCchwjb-Syc6B6tQhQpEZxOQJWn8Lx4zGCjE9lNzbDDBwbB1-npnOXPbqodtNCuVrtyD-DCBg2ShpONloX1zgzJXSG1S8a0Y-kP7lXVQSBFqmVGK518cJBqrqqMcZR_B2UuGAn1fZFFt9kD640ZzFkqsIcUf0sWrR9h8jZVjyAk6g3_U3qq3G20WYgQceNDmMgtR_YBCJLMrrEZjlGrXn-eN7D_Wu9hrgLda2uHk3ie3PIyilgGuxypFf3TTqYLFVfZgvgGcDNdgAaieve23Lytxnbkf2V7qcA31bJCg23hyZqKaiQpSmTpmUrvG6EQDeWDph7tMo",
          "Content-Type": "application/json"
        ]
        
        let queryString = "categories:" + type
        
        let parameters = [
          "query": queryString,
          "format": "json",
          "download": false,
          "num_records": 10
        ] as [String : Any]

        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.datafiniti.co/v4/products/search")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                // Get the array of product
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print(dataDictionary)
                
                // Store the movies in a property to use elsewhere
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
        })

        dataTask.resume()
    }
}
