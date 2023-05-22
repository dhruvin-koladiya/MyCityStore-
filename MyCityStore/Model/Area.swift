//
//  Area.swift
//  MyCityStore
//
//  Created by ABC on 31/03/23.
//

import Foundation


struct AreaAPIResponse: Decodable {
    var error: Bool
    var data: [Area]
}
