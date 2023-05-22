//
//  OrderPageViewController.swift
//  MyCityStore
//
//  Created by ABC on 10/04/23.
//

import UIKit

class OrderPageViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    
    var viewModel: OrderCategoryViewModel = OrderCategoryViewModel()
    var arrStoreDetali: [OrderViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchDetalis()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    // MARK: - Register Nib
    private func setup() {
        orderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.reloadData()
    }
    
    // MARK: - Get Home Page Detalis
    private func fetchDetalis() {
        guard Config.isInternetAvailable() else {
            print("Display No internet avalible popup")
            return
        }
        
        viewModel.fetchDetalis { result in
            switch result {
            case .success:
                print("Reload TableView")
                self.orderTableView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert view")
            }
        }
    }
}

extension OrderPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.storeNameLabel.text = "\(viewModel.arrStoreDetali[indexPath.row].getName())"
        cell.orderIdLabel.text = "\(viewModel.arrStoreDetali[indexPath.row].getOrderId())"
        cell.DateAndTimeLabel.text = "\(viewModel.arrStoreDetali[indexPath.row].getDateTime ())"
        cell.totalPriceLabel.text = "\(viewModel.arrStoreDetali[indexPath.row].getTotalPrice())"
        cell.statusLabel.text = "\(viewModel.arrStoreDetali[indexPath.row].getStatus())"
        cell.images.sd_setImage(with: URL(string: viewModel.arrStoreDetali[indexPath.row].getImage()), placeholderImage: UIImage(systemName: "fireplace"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}


