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

    var networking: NetworkManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networking = NetworkManager(environment: .staging,
                                    userType: "RESELLER",
                                    clientType: "menapay-business",
                                    clientVersion: "v3")
        
        networking.request(type: UserContainer.self, endpoint: .login()) { result in
            switch result {
            case .success(let response):
                let token = response.data.idToken
                self.networking.setToken(token)
                self.getAllTranscations()
            case .failure(let error):
                break
            }
        }
    }
    
    func getAllTranscations() {
        networking.request(type: TransactionContainer.self, endpoint: .getAllTranscations()) { result in
            switch result {
            case .success(let response):
                break
            case .failure(let error):
                break
            }
        }
    }
    
}

// MARK: Test Endpoints

extension Endpoint {
    static func login() -> Endpoint {
        return Endpoint(path: "/auth/corporate/login",
                        method: .post,
                        task: .requestParameters(["username": "+905323230541",
                                                  "password": "Mena123*",
                                                  "userType": "RESELLER"]),
                        authenticationRequired: false,
                        parametersEncoding: .body)
    }
}

extension Endpoint {
    static func getAllTranscations() -> Endpoint {
        return Endpoint(path: "/transaction/corporate/filter",
                        method: .get,
                        task: .requestParameters(["type": "USER",
                                                  "status": "COMPLETED"]),
                        parametersEncoding: .query)
    }
}

