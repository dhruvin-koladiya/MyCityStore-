//
//  APIManager.swift
//  MyCityStore
//
//  Created by ABC on 31/03/23.
//

import Foundation
import Alamofire

class APIManager {
    //URL
    //MethodType
    //Header
    //Parameter
    //Encoding Type
    
    func request(with url: String,
                 methodType: HTTPMethod = .get,
                 header: HTTPHeaders? = nil,
                 parameter: Parameters? = nil,
                 completionHandler: @escaping(Result<Data, APIError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completionHandler(.failure(.urlDoesNotFound))
            return
        }
        
        AF.request(url,method: methodType,
                   parameters: parameter,
                   encoding: URLEncoding.default,
                   headers: header).responseData { response in
            
            guard let statusCode = response.response?.statusCode,(200...299).contains(statusCode)
            else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = response.data
            else {
                completionHandler(.failure(.dataNotFound))
                return
            }
            
            completionHandler(.success(data))
        }
    }
}


//enum MethodType {
//    case get
//    case post
//    case put
//    case delete
//
//    var name: String {
//        switch self {
//        case .get: return "GET"
//        case .post: return "POST"
//        case .put: return "PUT"
//        case .delete: return "DELETE"
//    }
//}
//
//    var httpMethod: HTTPMethod {
//        switch self  {
//        case .get: return .get
//        case .post: return .post
//        case .put: return .put
//        case .delete: return .delete
//        }
//    }
//}

enum APIError: Error {
    case urlDoesNotFound
    case invalidResponse
    case dataNotFound
}
