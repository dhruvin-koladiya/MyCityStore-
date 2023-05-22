//
//  Config.swift
//  MyCityStore
//
//  Created by R82 on 28/03/23.
//

import Foundation
import UIKit

struct Config {
    
    static let appName = "My City Store"
    static let databaseName = "mycitystore.db"
    static let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let androidLink: String = ""
    static let iOSLink: String = ""
    static let appDateFormat = "dd mmm yyyy"
    static let appTimeFormat = "hh:mm a"
    static let serverDateFormat: String = "yyyy-mm-dd"
    static let amountSign: String = "₹"
   
    static func isInternetAvailable() -> Bool {
        let reachbility = Reachability()!
        return reachbility.isReachable ? (reachbility.isReachableViaWiFi || reachbility.isReachableViaWWAN) : false
    }
    
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURLForCategories = "https://myct.store/admin/uploads/food_type/"
    static let baseURLForImage = "https://myct.store/admin/uploads/"
    static let orderURL = "https://myct.store/Mobile_Services/user/v2/index.php/"
}
