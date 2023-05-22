//
//  BannerCollectionViewCell.swift
//  MyCityStore
//
//  Created by ABC on 05/04/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
 
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.setCorner(radious: 80)
        
    }

}
