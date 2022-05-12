//
//  OfferListViewCell.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import UIKit

class OfferListViewCell: UITableViewCell {
    
    
    @IBOutlet var offerImage: UIImageView!
    @IBOutlet var offerName: UILabel!
    @IBOutlet var offerCashback: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
