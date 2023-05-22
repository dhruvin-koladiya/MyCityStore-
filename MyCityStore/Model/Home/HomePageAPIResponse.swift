//
//  HomePageAPIResponse.swift
//  MyCityStore
//
//  Created by ABC on 01/04/23.
//

import Foundation

struct HomePageAPIResponce: Decodable {
    
    var error: Bool
    var arrstoreTypes: [StoreType]
    var arrbanners: [Banner]
    var arrvendors: [Vendor]
    var numberOfStore: Int
    
    enum CodingKeys: String, CodingKey {
        case error
        case arrbanners = "banner"
        case arrstoreTypes = "store_type"
        case numberOfStore = "num_stores"
        case arrvendors = "data"
        
    }
}

