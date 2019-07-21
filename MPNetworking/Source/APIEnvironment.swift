//
//  APIEnvironment.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

// MARK: API Environment Type

public enum APIEnvironment {
    case staging
    case development
    case live
}

// MARK: API Environment BaseURL

extension APIEnvironment {
    var baseURL: String {
        switch self {
        case .development:
            return "dev-menapay-current.eu-west-1.elasticbeanstalk.com"
        case .staging:
            return "https://staging.menapay.io"
        case .live:
            return "https://api.menapay.io"
        }
    }
}