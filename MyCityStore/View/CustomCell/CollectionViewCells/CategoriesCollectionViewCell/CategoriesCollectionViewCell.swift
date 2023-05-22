//
//  CategoriesCollectionViewCell.swift
//  MyCityStore
//
//  Created by ABC on 29/03/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setCorner(radious: 4)
       
    }

}
