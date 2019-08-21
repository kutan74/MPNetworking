//
//  NetworkError.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

// MARK: Network Error Type

public enum NetworkError: Error {
    case unknownError(Data)
    case networkFailure
    case unAuthorized
    case emptyJSONData
    case noValidEthererumAddressFound
    case invalidResponse(Data)
}

// MARK: Error Description

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyJSONData:
            return "!!! Empty json returned from the server !!!"
        case .networkFailure:
            return "Network failure happened"
        case .unAuthorized:
            return "Session timed out. Please log in"
        case .unknownError(_):
            return "Unknown error happened. Weird !!"
        case .noValidEthererumAddressFound:
            return "No valid ethererum address found"        
        case .invalidResponse:
            return "Invalid response received from server"
        }
    }
}

