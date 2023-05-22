//
//  VendorTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 29/03/23.
//

import UIKit

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var storeCountLabel: UILabel!
    @IBOutlet weak var vendorCollectionView: UICollectionView!
    var arrVendor: [VendorViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorCollectionView.setCorner(radious: 8)
        vendorCollectionView.register(UINib(nibName: "VendorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VendorCollectionViewCell")
       
    }

    func set(arrVendor: [VendorViewModel]) {
        self.arrVendor = arrVendor
        vendorCollectionView.delegate = self
        vendorCollectionView.dataSource = self
        vendorCollectionView.reloadData()
    }
  
    
}

extension VendorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return arrVendor.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VendorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorCollectionViewCell", for: indexPath) as! VendorCollectionViewCell
        let vendors: VendorViewModel = arrVendor[indexPath.row]
        cell.imagesView.sd_setImage(with: URL(string: vendors.getImageName()), placeholderImage: UIImage(systemName: "fireplace"))
        cell.storeNameLabel.text = vendors.getName()
        cell.openAndCloseLabel.text = String(vendors.isOpen())
        cell.rupeesLabel.text = "\(vendors.getMinimumOrder()) \(vendors.getDeliveryCharges())"
        return cell
    }
}

extension VendorTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 115)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
