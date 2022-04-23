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
    var detailSourceURL : URL?
    var description : String
    var imageURLArray : Array<URL> = []
    
    init(dict: [String: Any]) {
        // TODO: assigning the variables
        name = dict["name"] as! String
        
        let sourceArray = dict["domains"] as! Array<String>
        source = sourceArray[0]
        
        let priceArray = dict["prices"] as? Array<NSDictionary?>
        let firstItemDict = priceArray?[0] as? [String: Any]
        
        if firstItemDict != nil {
            price = String(firstItemDict?["amountMin"] as! Double)
            
            // for parsing detailSourceURL:
            let detailSourceURLArray = firstItemDict?["sourceURLs"] as! Array<String>
            detailSourceURL = URL(string: detailSourceURLArray[0])
        } else{
            price = "error"
            detailSourceURL = URL(string: "https://external-preview.redd.it/FK8dbGpQIaXWP_kKUx7uWaCJNJXMjqSVvzQjwhO4-G0.jpg?auto=webp&s=bb16847fe7da637256fedb59baec10c487c209b6")
        }
        
        // let priceDict = dict["prices"] as? [String: Any]
        // price = priceDict[0]["amountMin"] as! Int64
        let imageArray = dict["primaryImageURLs"] as? Array<String?>
        let alternateArray = dict["imageURLs"] as? Array<String?>
        if imageArray != nil {
            imageURL = URL(string: (imageArray?[0]!)!)
        } else if alternateArray != nil {
            imageURL = URL(string: (alternateArray?[0]!)!)
        } else {
            imageURL = URL(string: "https://static.thenounproject.com/png/2884221-200.png")
        }
        
        let descriptionsInJSON = dict["descriptions"] as? Array<NSDictionary?>
        let firstDescription = descriptionsInJSON?[0] as? [String : Any]
        
        description = firstDescription?["value"] as? String ?? "No description provided"
        
        // source = dict["domains"] as! String  // an array
        
        /*
        let imageURLsInJSON = dict["imageURLs"] as? Array<String> ?? []
        for string in imageURLsInJSON {
            let imgURL = URL(string: string) ?? URL(string: "https://static.thenounproject.com/png/2884221-200.png")
            imageURLArray.append(imgURL)
        }
         */
    }
}
