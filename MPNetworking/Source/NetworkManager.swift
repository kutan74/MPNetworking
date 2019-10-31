//
//  NetworkManager.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

// MARK: API

open class NetworkManager {
    /// URLSession
    private var session: NetworkMangerProtocol
    
    /// Bearer Token
    private var token: String?
    
    /// API Environment
    private let baseURL: String
    
    /// MenaPay User Type
    private let userType: String?
    
    /// API Client Type
    private let clientType: String?
    
    /// API Client Version
    private let clientVersion: String?
    
    private var customHeaders: [String: String]?
    
    
    public init(session: NetworkMangerProtocol = URLSession.shared,
                baseURL: String,
                userType: String? = nil,
                clientType: String? = nil,
                clientVersion: String? = nil,
                customHeaders: [String: String]?) {
        self.session = session
        self.baseURL = baseURL
        self.userType = userType
        self.clientType = clientType
        self.clientVersion = clientVersion
        self.customHeaders = customHeaders
    }
}

// MARK: Token Update

extension NetworkManager {
    /**
     Updates NetworkManager token value
     
     - Parameter token: Bearer token being received from API response
     */
    public func setToken(_ token: String) {
        self.token = token
    }
}

// MARK: Network Request

extension NetworkManager: EndpointProtocol {
    /**
     Makes API Request
     
     We also set default HTTP headers of the client such as clientVersion, clientType and the bearer token
     if it's set by the user
     
     - Parameter type: Generic type for decoding the response
     - Parameter endpoint: Endpoint of the call being requested
     - Parameter completion: Completion handler being returned
     
     - Returns: The generic type T
     */
    public func request(endpoint: Endpoint,
                           completion: @escaping (NetworkResponse) -> ()) {
        
        guard let baseURL = URL(string: baseURL) else {
            preconditionFailure("Failed to connect to host")
        }
        
        var request = URLRequest(endpoint: endpoint, baseURL: baseURL)
                
        /// Default client parameters
        
        if let clientVersion = clientVersion {
            request.addValue(clientVersion, forHTTPHeaderField: "menapay-version")
        }
                    
        if let clientType = clientType {
            request.addValue(clientType, forHTTPHeaderField: "menapay-client")
        }
        
        if let userType = userType {
            request.addValue(userType, forHTTPHeaderField: "userType")
        }
        
        if let customHeaders = customHeaders {
            for (key, value) in customHeaders {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
                    
        if endpoint.authenticationRequired {
            request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        
                
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        
        task.resume()
    }
    
    /**
     Handles data response returned from the api request
     
     - Parameter data: Data of the request being returned from the server
     - Parameter response: response of the request being returned from the server
     - Parameter error: Error of of the request returned from the server
     
     - Returns: NetworkResponse
            - In case server returns 401 it means the current session of the user is timed out
     */
    private func handleDataResponse(data: Data?,
                                                  response: HTTPURLResponse?,
                                                  error: Error?,
                                                  completion: (NetworkResponse) -> ()) {
        guard let response = response else {
            return completion(.failure(data: data, code: nil, message: ""))
            
        }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else {
                return completion(.failure(data: nil, code: nil, message: ""))
            }
            completion(.success(data))
        default:
            guard let data = data else {
                return completion(.failure(data: nil, code: response.statusCode, message: ""))
            }
            do {
                let failureRespnse = try self.decodeFailureMessageFromResponse(from: data)
                completion(.failure(data: data, code: response.statusCode, message: failureRespnse.message!))
            } catch {
                return completion(.failure(data: nil, code: response.statusCode, message: ""))
            }
        }
    }
    
    func decodeFailureMessageFromResponse(from data: Data) throws -> FailureResponse {
        let container = try JSONDecoder().decode(FailureResponse.self, from: data)
        return container
    }
}

