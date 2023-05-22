//
//  LocationTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 29/03/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var ariyaView: UIView!
    
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var ariyaButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchBarView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cityView.setCorner(radious: 5)
   cityView.setBorder(width: 1, color: .white)
        
        ariyaView.setCorner(radious: 5)
     ariyaView.setBorder(width: 1, color: .white)
      
     
        
        ariyaButton.setTitle("Adajan", for: .normal)
        cityButton.setTitle("Surat", for: .normal)
       
        
//        searchBarView.tintColor = AppColors.primaryColor
//        searchBarView.barTintColor = AppColors.primaryColor
//        searchBarView.backgroundColor = AppColors.primaryColor
//        
        let textFieldInsideSearchBar = searchBarView.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = UIFont.systemFont(ofSize: 16)
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: Placeholder.searchStore, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])

        textFieldInsideSearchBar?.setCorner(radious: 8)
        textFieldInsideSearchBar?.backgroundColor = .white
    }

    
    
    
}
