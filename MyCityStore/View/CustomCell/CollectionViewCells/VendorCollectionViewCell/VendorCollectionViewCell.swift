//
//  VendorCollectionViewCell.swift
//  MyCityStore
//
//  Created by ABC on 29/03/23.
//

import UIKit
import Cosmos

class VendorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagesView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var rupeesLabel: UILabel!
    @IBOutlet weak var openAndCloseLabel: UILabel!
    @IBOutlet weak var vendorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorView.setCorner(radious: 8)
       
    }

}
