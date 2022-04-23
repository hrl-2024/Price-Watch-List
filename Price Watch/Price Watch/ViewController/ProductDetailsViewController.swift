//
//  ProductDetailsViewController.swift
//  Price Watch
//
//  Created by William Lee on 2022/4/20.
//

import UIKit
import AlamofireImage
import UserNotifications

class ProductDetailsViewController: UIViewController {
    
    // Outlets:
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var timeSet = Date()
    let currentTime = Date()
    
    @IBOutlet weak var selectTimeTextField: UITextField!
    
    
    
    @IBAction func NotifyButton(_ sender: Any) {
        timeSet = timePicker.date
        
        let diffComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: currentTime, to: timeSet)
        let seconds = diffComponents.second! + diffComponents.minute!*60 + diffComponents.hour!*3600
        print("i am seconds", seconds)
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        let content = UNMutableNotificationContent()
        content.title = "It's time!"
        content.body = "You are able to purchase this product now."
        print("i am currentTime", currentTime)
        let date = currentTime.addingTimeInterval(Double(seconds))
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
        }
        selectTimeTextField.text?.removeAll()
    }
    
    let timePicker = UIDatePicker()
    
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
        
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ButtonClicked))
        toolbar.items = [doneBtn]
        selectTimeTextField.inputAccessoryView = toolbar
        selectTimeTextField.inputView = timePicker
        timePicker.datePickerMode = .time
        
        
    }
    
    @objc func ButtonClicked(){
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        selectTimeTextField.text = formatter.string(from: timePicker.date)
        print("i am timePicker.date", timePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let websiteView = segue.destination as! OfficialWebsiteViewController
        
        websiteView.productURL = product.detailSourceURL
    }
}
