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
        getAPIData()
        
    }
    
    // TODO: Get data from API helper and retrieve products
    func getAPIData() {
        
        let APIURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
        API.getProduct(with: APIURL) { (product) in
            guard let product = product else {
                // make sure movies is not empty
                return
            }
            self.products = product
            
            //TODO: change after setting up the tableview
            //self.MovieTableView.reloadData() // reloading the data
        }
    }
    
    
    @IBAction func onBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
