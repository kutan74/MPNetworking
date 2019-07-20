//
//  NetworkManagerProtocol.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public protocol NetworkMangerProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
    
    func dataTask(request: URLRequest,
                  completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: NetworkMangerProtocol {
    public func dataTask(request: URLRequest,
                         completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}
