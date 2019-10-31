//
//  NetworkResponse.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

public enum NetworkResponse {
    case success(Data)
    case failure(data: Data?, code: Int?, message: String?)
}

struct FailureResponse: Codable {
    var message: String?
    var code: Int?
}
