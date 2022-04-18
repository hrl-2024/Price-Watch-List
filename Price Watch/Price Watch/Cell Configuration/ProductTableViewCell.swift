//
//  ProductTableViewCell.swift
//  Price Watch
//
//  Created by Henry Liu on 4/15/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    // the current product:
    var product : Product! {
        didSet {
            productNameLabel.text = product.name
            priceLabel.text = product.price
            sourceLabel.text = product.source
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
