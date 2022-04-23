//
//  SearchResultViewController.swift
//  Price Watch
//
//  Created by Henry Liu on 4/8/22.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    // data structure for the tableView
    var products = [Product]()
    
    var searchText: String!
    
    
    // Outlets:
    @IBOutlet weak var productTableView: UITableView!
    
    let mainQueue = DispatchQueue.main
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.dataSource = self
        productTableView.delegate = self

        // Do any additional setup after loading the view.
        getAPIData(withType: searchText)
        
    }
    
    // TODO: Get data from API helper and retrieve products
    @objc func getAPIData(withType: String) {
        
        API.getProduct(ofType: withType) { (product) in
            guard let product = product else {
                // make sure movies is not empty
                return
            }
            self.products = product
            
            self.mainQueue.async {
                self.productTableView.reloadData() // reloading the data
            }
        }
    }
    
    @IBAction func onBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    // For the tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueing reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        
        let product = products[indexPath.row]
        
        cell.product = product
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = productTableView.indexPath(for: cell) {
            let product = products[indexPath.row]
            
            // pass the product to the detailviewController
            let detailViewController = segue.destination as! ProductDetailsViewController
            detailViewController.product = product
            
            productTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
