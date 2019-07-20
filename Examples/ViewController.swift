//
//  ViewController.swift
//  Examples
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit
import MPNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networking = NetworkManager(environment: .staging,
                                        userType: "RESELLER",
                                        clientType: "menapay-business",
                                        clientVersion: "v3")
        
        networking.request(type: UserContainer.self, endpoint: .login()) { result in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                break
            }
        }
    }
}


extension Endpoint {
    static func login() -> Endpoint {
        return Endpoint(path: "/auth/corporate/login",
                        method: .post,
                        task: .requestParameters(["username": "+905323230541","password": "Mena123*", "userType": "RESELLER"]),
                        authenticationRequired: false,
                        parametersEncoding: .body)
    }
}
