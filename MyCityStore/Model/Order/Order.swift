//
//  Order.swift
//  MyCityStore
//
//  Created by ABC on 10/04/23.
//

import Foundation
import SwiftUI

struct Order: Decodable {
    
    var orderId: String
    var totalPrice: String
    var collectDate: String
    var deliveryCollectionTime: String
    var image: String
    var name: String
    var dateTime: String
    var orderStatus: String
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case totalPrice = "total_price"
        case collectDate = "collect_date"
        case deliveryCollectionTime = "delivery_collection_time"
        case image = "vimage"
        case name = "vname"
        case dateTime = "date_time"
        case orderStatus = "oreder_status"

    }
}


struct OrderViewModel {
    private let order: Order
    
    init(order: Order) {
        self.order = order
    }
    func getOrderId() -> String { order.orderId }
    func getTotalPrice() -> String { return "Payment Amount: \(order.totalPrice)" }
    
    func getImage() -> String {
        return Config.baseURLForImage + (order.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") }
    func getName() -> String { order.name}
    func getDateTime() -> String { order.dateTime }
    func getStatus() -> String { order.orderStatus}
}







