//
//  Vendor.swift
//  MyCityStore
//
//  Created by ABC on 01/04/23.
//

import Foundation
import UIKit

struct Vendor: Decodable {
    
    var id: String
    var name: String
    var image: String
    var businessName: String
    var address: String
    var deliveryTime: String
    var deliveryTimeParameter: String
    var minOrder: String
    var deliveryCharges: String
    var isOpen: String
    var extraCharge: String
    var favouriteVendor: String
    var favId: String
    var rating: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, address, rating
        case businessName = "business_name"
        case deliveryTime = "delivery_time"
        case deliveryTimeParameter = "delivery_time_in"
        case minOrder = "min_order"
        case deliveryCharges = "delivery_charges"
        case isOpen = "isopen"
        case extraCharge = "extra_charge"
        case favouriteVendor = "favouriteRestau"
        case favId = "favid"
        
        
    }
}


struct VendorViewModel {
    private let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendor = vendor
    }
    
    func getid() -> String { vendor.id }
    func getName() -> String { vendor.businessName }
    func getImageName() -> String {
        return Config.baseURLForImage + (vendor.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    
    func isOpen() -> Bool { vendor.isOpen == "open" }
    func getDeliveryCharges() -> String {
        //return String(format: "Delivery Fees: $%2f", Float(vendor.deliveryCharges) ?? 0)
        return "Delivery Fees: $\(vendor.deliveryCharges)"
    }
    func getMinimumOrder() -> String {
        return "Min. Order: $\(vendor.minOrder)"
    }
    func getRating() -> Float { Float(vendor.rating) ?? 0 }
    func isFav() -> Bool { vendor.favouriteVendor == "yes" }
    
    
}
