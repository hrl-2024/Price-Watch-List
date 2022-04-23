//
//  Product.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import Foundation

class Product {
    var name : String
    var price : String?
    var imageURL : URL?
    var source : String
    var currency: String?
    var shipping: String?
    // var description : String
    
    
    init(dict: [String: Any]) {
        // TODO: assigning the variables
        name = dict["name"] as! String
        
        let sourceArray = dict["domains"] as! Array<String>
        source = sourceArray[0]
        
        let priceArray = dict["prices"] as? Array<NSDictionary?>
        let firstItemDict = priceArray?[0] as? [String: Any]
        if let firstDict = firstItemDict{
            price = String(firstItemDict?["amountMin"] as! Double)
            currency = firstItemDict?["currency"] as! String
            
        }else{
            price = "error"
            currency = "error"
        }
        
        // let priceDict = dict["prices"] as? [String: Any]
        // price = priceDict[0]["amountMin"] as! Int64
        let imageArray = dict["primaryImageURLs"] as? Array<String?>
        if let photoArray = imageArray{
            imageURL = URL(string: (imageArray?[0]!)!)
        }else{
            imageURL = URL(string: "https://static.thenounproject.com/png/2884221-200.png")
        }
        
        if let shippingPrice = dict["shipping"]{
            shipping = (shippingPrice as! String)
        }else{
            shipping = "error"
        }
        
        // source = dict["domains"] as! String  // an array
        // description = dict["descriptions"] as! String
    }
}
