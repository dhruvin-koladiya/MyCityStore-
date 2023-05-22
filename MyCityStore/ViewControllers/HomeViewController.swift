//
//  HomeViewController.swift
//  MyCityStore
//
//  Created by ABC on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Variables
    var viewModel: HomeViewModel = HomeViewModel()
    var tableViewCell: [String] = ["LocationTableViewCell", "CategoriesTableViewCell", "BannerTableViewCell", "DeliveryOptionTableViewCell", "VendorTableViewCell"]
   // var arrArea: [Area] = []
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //fetchHomePageDetails()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    // MARK: - Initialization
    private func setup() {
       fetchDetails()
    
        tableViewCell.forEach { cellName in
            tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
    }

  
    // MARK: - Get Home Page Details
    
    
//   private func fetchHomePageDetails() {
//
//        let apiManager: APIManager = APIManager()
//        apiManager.request(with: APIEndPoint.getArea.url) { response in
//            switch response {
//            case.success(let data): print("Data \(data)")
//                 do {
//                     let areaAPIResponse = try JSONDecoder().decode(AreaAPIResponse.self, from: data)
//                     print(areaAPIResponse)
//                  } catch {
//                        print("kaik locho maryooooo")
//                  }
//                   case .failure(let error):
//                   print(error.localizedDescription)
//            }
//        }
//    }
    
    private func fetchDetails() {
    
  
    
        guard Config.isInternetAvailable() else {
            print("Display No Internet Available Popup")
            return
        }
        viewModel.fetchDetails { result in
            switch result {
            case .success:
                print("Reload Table View")
                self.tableView.reloadData()
            case.failure(let error):
                print("Show this \(error) in alert view")
            }
        }
    }
    
    }



extension HomeViewController: UITableViewDelegate, UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as! CategoriesTableViewCell
            cell.delegate = self
            cell.set(arrCategories: viewModel.arrCategories, selectedCategoryIndex: viewModel.selectedCategoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.delegate = self
            cell.set(arrBanners: viewModel.arrBanners)
            cell.setCorner(radious: 15)
            return cell
        case 3:
            let cell: DeliveryOptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryOptionTableViewCell") as! DeliveryOptionTableViewCell
            cell.delegate = self
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VendorTableViewCell") as! VendorTableViewCell
            cell.set(arrVendor: viewModel.arrVendors)
            return cell
        default: return UITableViewCell()
        }
    
    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch section {
//        case 0: return 0
//        case 1: return 8
//        case 2: return 0
//        case 3: return 16
//        case 4: return 8
//        default: return 16
//        }
//
//}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 120
        case 1: return 65
        case 2: return 180
        case 3: return 65
        case 4: return 350
        default: return 44

        }
        
    }
    
    
   }


extension HomeViewController: CategoriesTableViewCellDelegate {
    func didSelect(at index: Int) {
        viewModel.updated(selectedCategoryIndex: index)
            tableView.reloadData()
            fetchDetails()
    }
   
    
}
    
extension HomeViewController: DeliveryOptionTableViewCellDelegate {
    func deliveryOptionSegmentTapped(selectedIndex: Int) {
        viewModel.update(selectedDeliveryIndex: selectedIndex)
        tableView.reloadData()
        fetchDetails()
                         
    }
    
}

extension HomeViewController: BannerTableViewCellDelegate {
    func didSelectBanner(at index: Int) {
        print(index)
    }
}




