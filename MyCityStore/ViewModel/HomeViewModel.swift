//
//  HomeViewModel.swift
//  MyCityStore
//
//  Created by ABC on 05/04/23.
//

import Foundation
import Alamofire



final class HomeViewModel {
    
  
    private(set) var section: [HomePageTableSection] = []
    private(set) var arrCategories: [StoreTypeViewModel] = []
    private(set) var arrBanners: [BannerViewModel] = []
    private(set) var arrVendors: [VendorViewModel] = []
    private(set) var vendorCount: Int = 0
    private let apiManager: APIManager = APIManager()
    private(set) var  selectedCategoryIndex: Int = 0
    private(set) var selectedDeliveryIndex: Int = 0
    
   
    func fetchDetails(completion: @escaping(Result<(), Error>) -> Void) {
        let parameter: Parameters = ["area_id" : "4",
                                      "city_id" : "1",
                                     "custid" : "",
                                      "store_type" : selectedCategoryIndex == 0 ? "" : arrCategories[selectedCategoryIndex].getid(),
                                      "type" : selectedDeliveryIndex == 0 ? "takeaway" : "delivery"]
        apiManager.request(with: APIEndPoint.homePage.url, methodType: .post, parameter: parameter) {  response in
            switch response {
            case .success(let data):

                do {
                    let homePageAPIResponse = try JSONDecoder().decode(HomePageAPIResponce.self, from: data)

                    self.arrCategories = homePageAPIResponse.arrstoreTypes.map{ StoreTypeViewModel(storeType: $0)}
                    self.arrBanners = homePageAPIResponse.arrbanners.map{ BannerViewModel(banner: $0)}
                    self.arrVendors = homePageAPIResponse.arrvendors.map{ VendorViewModel(vendor: $0)}
                    self.vendorCount = homePageAPIResponse.numberOfStore
                    print(self.arrCategories)
                    completion(.success(()))

                } catch {
                    completion(.failure(APIError.invalidResponse))
                }

            case.failure(let error):
                completion(.failure(error))

            }
        }
    }

    
 
    func updated(selectedCategoryIndex: Int) {
        self.selectedCategoryIndex = selectedCategoryIndex
    }

    func update(selectedDeliveryIndex: Int) {
        self.selectedDeliveryIndex = selectedDeliveryIndex
    }

}

extension HomeViewModel {
    func numberOfSection() -> Int {
        if arrCategories.count > 0, arrBanners.count > 0, arrVendors.count > 0 {
            return 5
        }
        return 0
    }
    func numberOfRow() -> Int { return 1 }
}


enum HomePageTableSection {
    case address
    case category(arrCategories: [StoreTypeViewModel])
    case banner(arrBanners: [BannerViewModel])
    case deliveryOption(name: String)
    case vendor(arrVendors: [VendorViewModel])
}

