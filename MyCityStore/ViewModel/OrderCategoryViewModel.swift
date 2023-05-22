//
//  OrderCategoryViewModel.swift
//  MyCityStore
//
//  Created by ABC on 10/04/23.
//

import Foundation
import Alamofire
import UIKit


final class OrderCategoryViewModel {
    // MARK: - Variable
    private let apiManager: APIManager = APIManager()
    private(set) var arrStoreDetali: [OrderViewModel] = []
    
    // MARK: - Almofire Method
    func fetchDetalis(completion: @escaping(Result<(), Error>) -> Void) {
        apiManager.request(with: APIEndPoint.order.url , methodType: .get) {
            response in
            switch response {
            case .success(let data):
                do {
                    let orderAPIResponse = try JSONDecoder().decode(OrderPageAPIResponse.self, from: data)
                    self.arrStoreDetali = orderAPIResponse.orderData.map { OrderViewModel(order: $0)}
                    print(self.arrStoreDetali)
                    completion(.success(()))
                } catch {
                    completion(.failure(APIError.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension OrderCategoryViewModel {
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRow() -> Int {arrStoreDetali.count }
}

enum OrderPageTableSection {
    case order(arrOrder: [OrderViewModel])
}
