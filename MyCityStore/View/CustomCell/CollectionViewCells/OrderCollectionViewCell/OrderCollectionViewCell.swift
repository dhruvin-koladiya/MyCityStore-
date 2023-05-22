//
//  OrderCollectionViewCell.swift
//  MyCityStore
//
//  Created by ABC on 10/04/23.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var reOrderButton: UIButton!
    @IBOutlet weak var cancelOrderButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
