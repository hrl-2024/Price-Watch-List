//
//  Product.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import Foundation

class Product {
    var name : String
    // var price : Int64
    // var imageURL : URL?
    // var source : String
    // var description : String
    
    init(dict: [String: Any]) {
        // TODO: assigning the variables
        name = dict["name"] as! String
        
        // let priceDict = dict["prices"] as? [String: Any]
        // price = priceDict[0]["amountMin"] as! Int64
        // imageURL = URL(string: dict["primaryImageURLs"] as! String)
        // source = dict["domains"] as! String  // an array
        // description = dict["descriptions"] as! String
    }
}
