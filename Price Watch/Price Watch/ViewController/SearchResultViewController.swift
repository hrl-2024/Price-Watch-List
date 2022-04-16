//
//  SearchResultViewController.swift
//  Price Watch
//
//  Created by Henry Liu on 4/8/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    // for the tableView
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getAPIData(withType: "shoes")
        
        print(products)
        
    }
    
    // TODO: Get data from API helper and retrieve products
    func getAPIData(withType: String) {
        
        API.getProduct(ofType: withType) { (product) in
            guard let product = product else {
                // make sure movies is not empty
                return
            }
            self.products = product
            
            //TODO: reloading the data after setting up tableview
            //self.ProductTableView.reloadData() // reloading the data
        }
    }
    
    
    @IBAction func onBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
