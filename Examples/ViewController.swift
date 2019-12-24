//
//  ViewController.swift
//  Examples
//
//  Created by KUTAN ÇINGISIZ on 21.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import MPNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let networking = NetworkManager(baseURL: "https://jsonplaceholder.typicode.com", userType: "", clientType: "", clientVersion: "", customHeaders: [:])
        networking.request(endpoint: .todos1()) { result in
            
        }
    }
}

extension Endpoint {
    static func todos1() -> Endpoint {
        return Endpoint(path: "/todos/1", method: .get, task: .requestPlain,authenticationRequired: false, parametersEncoding: .query)
    }
    
    static func commentsQuery() -> Endpoint {
        return Endpoint(path: "/comments", method: .post, task: .requestMultipleQuery(["params": ["key1","key2"]]),authenticationRequired: false, parametersEncoding: .query)
    }
    
    static func simpleBodyPost() -> Endpoint {
        return Endpoint(path: "/comments", method: .post, task: .requestParameters(["key": "value"]),authenticationRequired: false, parametersEncoding: .body)
    }
}
