//
//  URLRequest+Endpoint.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

// MARK: URLRequest Query Parameter

extension URLRequest {
    /**
     Handles body parameters of the request
     
     - Parameter endpoint: Endpoint being requested
     - Parameter baseURL: BaseURL of the endpoint being requested
     */
    init(endpoint: Endpoint, baseURL: URL) {
        let urlComponents = URLComponents(endpoint: endpoint, baseURL: baseURL)
        
        self.init(url: urlComponents.url!)
        
        httpMethod = endpoint.method.rawValue
        
        guard case let .requestParameters(parameters) = endpoint.task, endpoint.parametersEncoding == .body else {
            return
        }
        
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}
