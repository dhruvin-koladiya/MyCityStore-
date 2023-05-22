//
//  APIEndPoints.swift
//  MyCityStore
//
//  Created by ABC on 31/03/23.
//

import Foundation

enum APIEndPoint {
    
    case getArea
  //  case getArea(cityId: Int)
    case getCity
    case homePage
    case order
    
    var url: String {
        switch self {
//        case .getArea(let cityId):
//            return "\(Config.baseURL)/get_area/(cityId)"
        case .getArea:
            return "\(Config.baseURL)/get_area"
        case .getCity:
            return "\(Config.baseURL)/get_city"
        case .homePage:
            return "\(Config.baseURL)/homepage"
        case .order:
            return "\(Config.baseURL)/get_order/8"
        }
    }
}
