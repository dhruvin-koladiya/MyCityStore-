//
//  OrderTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 13/04/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

   
    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var totalPriceLabel: UILabel!
   @IBOutlet weak var DateAndTimeLabel: UILabel!
   @IBOutlet weak var Views: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Views.setCorner(radious: 8)
        Views.setBorder(width: 1, color: .white)
        
        
    }

   
}

