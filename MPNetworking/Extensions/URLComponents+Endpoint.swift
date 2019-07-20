//
//  URLComponents+Endpoint.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

// MARK: URLComponents Body Parameters Mapping

extension URLComponents {
    /**
     Handles query parameters of the request
     
     - Parameter endpoint: Endpoint being requested
     - Parameter baseURL: BaseURL of the endpoint being requested
     */
    init(endpoint: Endpoint, baseURL: URL) {
        let url = baseURL.appendingPathComponent(endpoint.path)
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case let .requestParameters(parameters) = endpoint.task, endpoint.parametersEncoding == .query else { return }
        
        queryItems = parameters.map { key, value in            
            return URLQueryItem(name: key, value: String(describing: value))
        }
        
    }
}
