//
//  OrderTableViewCell.swift
//  MyCityStore
//
//  Created by ABC on 12/04/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var reOrderButton: UIButton!
    @IBOutlet weak var cancelOrderButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var arrOrder: [OrderViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
       tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
    
        
         
        
      
    }

  func  set(arrOrder: [OrderViewModel]) {
       self.arrOrder = arrOrder
      tableView.reloadData()
      tableView.delegate = self
      tableView.dataSource = self
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
      cell.imagesView.sd_setImage(with: URL(string: orders.getImage()), placeholderImage: UIImage(systemName: "fireplace"))
        cell.orderIdLabel.text = orders.getOrderId()
        cell.dateAndTimeLabel.text = orders.getDateTime()
        cell.amountLabel.text = orders.getTotalPrice()
        cell.statusLabel.text = orders.getStatus()
        cell.amountLabel.text = orders.getTotalPrice()

        return cell
 }
    
    
}
