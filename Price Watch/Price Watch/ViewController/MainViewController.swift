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
    
    @IBAction func onSearch(_ sender: Any) {
        performSegue(withIdentifier: "showSearchResult", sender: nil)
    }
}
