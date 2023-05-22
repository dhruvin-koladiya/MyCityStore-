//
//  CategoriesTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 29/03/23.
//

import UIKit

protocol CategoriesTableViewCellDelegate: AnyObject {
    func didSelect(at index: Int)
}
class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var arrCategories: [StoreTypeViewModel] = []
    var selectedCategoryIndex: Int = 0
    var delegate: CategoriesTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }

    
    func set(arrCategories: [StoreTypeViewModel], selectedCategoryIndex: Int) {
        self.arrCategories = arrCategories
        self.selectedCategoryIndex = selectedCategoryIndex
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.reloadData()
    }
    
    
}


extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:100, height: 60)
    }
    
}

extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoriesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.nameLabel.backgroundColor = .lightGray
        cell.nameLabel.setCorner(radious: 4)
        cell.nameLabel.setBorder(width: 1, color: .systemRed)
        let category: StoreTypeViewModel = arrCategories[indexPath.row]
        if selectedCategoryIndex == indexPath.row {
            cell.nameLabel.textColor = .white
            cell.nameLabel.backgroundColor = .systemRed
            cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            
        } else {
            cell.backgroundColor = .white
            cell.nameLabel.backgroundColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        }
        cell.nameLabel.text = category.getType()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}
