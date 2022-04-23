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
          "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2ZmdqY2xtYno3YmdpNHlkN3A1NnZrbHp3eWZiNmE1ayIsImlzcyI6ImRhdGFmaW5pdGkuY28ifQ.AsCueyRDPb9EHhJH9gAJY63_dQ01VIerjfS9CwcnAZAK1iIRjTbF7UDgyMlqnKanr51loLllZxc8t4mUH_i56xH9S-24dUcub6Lg31SJz_MTdLMrsaE9WpjMrHE8Qy0P0gt4-FppDW_ojK6fNeITCzB7IbVKDOBoOhbTWHZdLxMC-0x6PlL1bWlnHejaen5eA4FylSs3H_HZ-hl1u5ZQvVz4f1l8dIwUzIxUdQcfnK8pm4qfNyHeEWVu5rcYyvGdNA1B9MWubL_RuezgHxaZcFDPFo2KLGMqvVjaBNyUN95suopfP9FKpJVm2vpC2JqXg9gk_D-cj52WnX3KiYTkk7hlb8LSm8QlOf506jMd5IpFqLZZiUkNPbBgWuj3pIIgnwrXD2vue5Ht1Jlm-eUJ_r-jZ7H5LUYW4B78rvsCCIHD2rV56cLPvYw4teBGwsvZQkZOSqS4Wi-DLCpryVEKDBEbbClUXetHPP1TxqUz70WhDyF9z8IImyrPAwy6vIOrh0vQwz_t_MnP4kkf0Rmn6Mp0jyl6KThq_Xl4iJqlgv8f-YaueUVk2qkD6CZIMf1gzP28uth1p4aCJakx4dSn6GBOQ6vMI4ZbGrMWh745EsdJOtCLMr4Wn2YEZizRRbHGhnGQXRPDGuFiI4e9gCdcEv-wSPK975Lj-72v8OEJ9nI",
          "Content-Type": "application/json"
        ]
        
        let queryString = "categories:" + type
        
        let parameters = [
          "query": queryString,
          "format": "json",
          "download": false,
          "num_records": 3
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
                print("I am data dictionary", dataDictionary)
                
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
