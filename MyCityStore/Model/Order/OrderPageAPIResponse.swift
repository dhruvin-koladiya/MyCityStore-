//
//  OrderPageAPIResponse.swift
//  MyCityStore
//
//  Created by ABC on 10/04/23.
//

import Foundation


struct OrderPageAPIResponse: Decodable {
    
    var error: Bool
    var orderData: [Order]
    
    enum CodingKeys: String, CodingKey {
        case error
        case orderData = "data"
    }
}
