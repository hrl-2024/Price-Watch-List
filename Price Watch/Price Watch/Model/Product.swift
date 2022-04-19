//
//  Product.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import Foundation

class Product {
    var name : String
    var price : String
    var imageURL : URL!
    var source : String
    // var description : String
    
    init(dict: [String: Any]) {
        // TODO: assigning the variables
        name = dict["name"] as! String
        
        let sourceArray = dict["domains"] as! Array<String>
        source = sourceArray[0]
        
        let priceArray = dict["prices"] as! Array<NSDictionary?>
        let firstItemDict = priceArray[0] as! [String: Any]
        let priceNum = firstItemDict["amountMin"] as! Double
        price = String(priceNum)
        
        // let priceDict = dict["prices"] as? [String: Any]
        // price = priceDict[0]["amountMin"] as! Int64
         let imageArray = dict["primaryImageURLs"] as! Array<String?>
        let imagePath = URL(string: imageArray[0]! )
        imageURL = imagePath
        
        // source = dict["domains"] as! String  // an array
        // description = dict["descriptions"] as! String
    }
}
