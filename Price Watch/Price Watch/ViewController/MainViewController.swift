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
                if searchBar.text != ""{
                    SearchResult.searchText = searchBar.text!
                }else{
                    showAlert()
                }
            }
        }
    }
    
    @IBAction func onSearch(_ sender: Any) {
        //performSegue(withIdentifier: "showSearchResult", sender: nil)
        performSegue(withIdentifier: "showResult", sender: self)
        searchBar.text?.removeAll()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Missing Keyword", message: "Please enter keywords!", preferredStyle: .alert )
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action  in
            print("tapped dismiss")
        }))
        
        present(alert, animated: true)
    }
}
