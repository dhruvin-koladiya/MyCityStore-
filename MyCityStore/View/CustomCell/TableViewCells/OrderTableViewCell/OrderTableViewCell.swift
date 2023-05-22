//
//  OrderTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 10/04/23.
//

import UIKit
import SDWebImage

class OrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var backgroundViews: UIView!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var reOrderButton: UIButton!
    @IBOutlet weak var cancelOrderButton: UIButton!
    
    var arrOrder: [OrderViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
       orderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        backgroundViews.setCorner(radious: 5)
        backgroundViews.setBorder(width: 1, color: .green)
       
       
    }

    
    func set(arrOrder: [OrderViewModel]) {
        self.arrOrder = arrOrder
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.reloadData()
        
    }
}


extension OrderTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        let orders: OrderViewModel = arrOrder[indexPath.row]
        cell.images.sd_setImage(with: URL(string: orders.getImage()), placeholderImage: UIImage(systemName: "fireplace"))
        cell.storeNameLabel.text = orders.getName()
        cell.statusLabel.text = orders.getStatus()
        cell.amountLabel.text = orders.getStatus()
        cell.idLabel.text = orders.getOrderId()
        cell.dateAndTimeLabel.text = orders.getDateTime()
        return cell
        
    }

}
