//
//  ProductDetailsViewController.swift
//  Price Watch
//
//  Created by William Lee on 2022/4/20.
//

import UIKit
import AlamofireImage

class ProductDetailsViewController: UIViewController {
    
    // Outlets:
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var product: Product!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productName.text = product.name
        productName.sizeToFit()
        
        productPrice.text = "$" + (product.price ?? "no price")
        
        productDescription.text = product.description
        productDescription.sizeToFit()
        
        imageView.af.setImage(withURL: product.imageURL!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let websiteView = segue.destination as! OfficialWebsiteViewController
        
        websiteView.productURL = product.detailSourceURL
    }
}
