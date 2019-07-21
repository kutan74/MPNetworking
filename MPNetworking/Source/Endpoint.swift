//
//  Endpoint.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//


// MARK: Endpoint

public class Endpoint {
    
    /// Path of the api call
    var path: String
    
    /// HTTP Method
    var method: HTTPMethod
    
    // HTTP Task
    var task: Task
    
    // Is bearer token required as header
    var authenticationRequired: Bool
    
    // Request encoding type
    var parametersEncoding: EncodingType
    
    public init(path: String,
                method: HTTPMethod,
                task: Task,
                authenticationRequired: Bool = true,
                parametersEncoding: EncodingType) {        
        self.path = path
        self.method = method
        self.task = task
        self.authenticationRequired = authenticationRequired
        self.parametersEncoding = parametersEncoding
    }
}
