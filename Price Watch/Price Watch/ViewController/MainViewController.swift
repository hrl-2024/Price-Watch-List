//
//  MainViewController.swift
//  Price Watch
//
//  Created by Henry Liu on 4/8/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // Outlet
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchBar.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
                if let destVC = segue.destination as? UINavigationController,
                    let SearchResult = destVC.topViewController as? SearchResultViewController {
                    SearchResult.searchText = searchBar.text!
                }
        }
    }
    
    @IBAction func onSearch(_ sender: Any) {
        //performSegue(withIdentifier: "showSearchResult", sender: nil)
        performSegue(withIdentifier: "showResult", sender: self)
    }
}
