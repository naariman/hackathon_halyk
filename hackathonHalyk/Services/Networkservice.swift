//
//  Networkservice.swift
//  hackathonHalyk
//
//  Created by Nariman on 20.01.2024.
//

import Alamofire
import Foundation

enum NetworkError: Error {
    case badUrl
    case badRequest
    case badResponse
    case invalidData
}

final class NetworkService {
    
    static let shared = NetworkService(); private init(){}
    
    
    
}
