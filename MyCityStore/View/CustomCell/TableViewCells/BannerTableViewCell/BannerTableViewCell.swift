//
//  BannerTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 29/03/23.
//

import UIKit
import SDWebImage

protocol BannerTableViewCellDelegate: AnyObject {
    func didSelectBanner(at index: Int)
}

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var arrBanners: [BannerViewModel] = []
    weak var delegate: BannerTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
      
        bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
    
    }

    func set(arrBanners: [BannerViewModel]) {
        self.arrBanners = arrBanners
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.reloadData()
    }
    
    
}


extension BannerTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 425, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let banner: BannerViewModel = arrBanners[indexPath.row]
        cell.imgView.sd_setImage(with: URL(string: banner.getImage()), placeholderImage: UIImage(systemName: "fireplace"))
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectBanner(at: indexPath.row)
    }
}
