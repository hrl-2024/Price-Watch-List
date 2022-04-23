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
          "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2aWZ0ZTY0YTVkdG9zOTVweGMwODE5bmdqMXk4d29pcSIsImlzcyI6ImRhdGFmaW5pdGkuY28ifQ.RwGWtkl_u66Q3Mb5jWBPtAmujMzDnVDFWxe0xjMBRF3O5bk-PCC_h6YqHSGk4blSx2BF-FCbDoOOczJ9SQU4_a6dzKGg1wlDB-DQ3IUJiq-F9q4tJtqUHfIN7voAW6XFsQHR5ccLhUVV7yuz6hpN5mGJtwSvyFJfjGTV3vTv7hiKzcGSacxGRoajBTrBjZB1TWKkhk6nN3quizYp-qb3-IXw-gxWyHOKmHEIdAUajVjve6OUqLKCtbHSuSwn1hYKx11JUdL6MtcGM6yeRHZ3R5ULdufxxmKSTXLdc1la65egZkyFVjZYH1MlK3Z152ejqbCGiw-1R3C-Qv6SIafDsPtAMVa5mjiNM5Dcs_xdpoKJP1boRSRXTUU64_zL21HGlE5bUju3Xn8Gsw6qo2qvu7CjqC4e1PplJt6LjV7G2wHZgjgLaE-wlvqf21J5w8JkRAGYxw5Jaf6h3UPmuCsPGVu3tnN-S6ChhtiR93K25oJUOFABiAcHueJpq2d347SZIpQFa2yIY8VGSNSI_f_s3NZwwLFs2tVFH7Sq7z3A35t-POgEHCUCz-6U9938YwFe9xOWhdlXAzj_OGEe0Xhk96F5jq9se1FCFwpkZGCaXxZ_1YEk768V_QFHiFbhEvPonRGCbx-LdQtfUZnEt43-i-H6LAQw5iRNEitJcbptp3g",
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
