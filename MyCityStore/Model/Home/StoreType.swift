//
//  StoreType.swift
//  MyCityStore
//
//  Created by ABC on 01/04/23.
//

import Foundation

struct StoreType: Decodable {
    var id: String
    var type: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id, type, image
    }
}

struct StoreTypeViewModel {
    private let storeType: StoreType
    
    init(storeType: StoreType) {
        self.storeType = storeType
    }
    
    func getid() -> String { storeType.id }
    func getType() -> String { storeType.type }
    func getImageName() -> String {
        return Config.baseURLForCategories + (storeType.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
