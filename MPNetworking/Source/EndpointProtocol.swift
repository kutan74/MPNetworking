//
//  EndpointProtocol.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

public protocol EndpointProtocol {
    func request<T>(endpoint: Endpoint,
                    completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}
