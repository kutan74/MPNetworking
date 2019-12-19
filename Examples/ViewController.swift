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
        
        let networking = NetworkManager(baseURL: "https://google.com", userType: "test", clientType: "TEST", clientVersion: "v2", customHeaders: [:])
        networking.request(endpoint: .test()) { result in
            
        }
    }
}

extension Endpoint {
    static func test() -> Endpoint {
        return Endpoint(path: "/test", method: .get, task: .requestMultipleQuery(["key": ["value1", "value2"]]),authenticationRequired: false, parametersEncoding: .query)
    }
}
