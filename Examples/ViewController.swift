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
        
        let networking = NetworkManager(baseURL: "https://staging.menapay.io",
                                        userType: "PERSONAL",
                                        clientType: "ios-payment",
                                        clientVersion: "v9")
        networking.setToken("1fb054be-217b-4c9f-826b-ef92e36a3")
        
        networking.request(endpoint: .createTransaction()) { result in
            
        }
        
    }


}

extension Endpoint {
    static func createTransaction() -> Endpoint {
        return Endpoint(path: "/ethereum/transfer/create",
                        method: .post,
                        task: .requestParameters(["toAddress": "0x43Ef4137e38E098c4c4E51014abD9f5B83FF61Cf", "amount": 0]),
                        parametersEncoding: .body)
    }
}
