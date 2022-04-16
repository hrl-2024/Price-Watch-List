//
//  Product.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import Foundation

class Product {
    var name : String
    var imageURL : URL?
    var detail : String
    var review : String
    
    init(dict: [String: Any]) {
        // TODO: assigning the variables
        name = ""
        imageURL = URL(string: "")
        detail = ""
        review = ""
    }
}
