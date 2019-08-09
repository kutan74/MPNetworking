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
        
        let networking = NetworkManager(environment: .development, userType: "", clientType: "", clientVersion: "")
        networking.setToken("")
        networking.request(endpoint: .getUserBalance()) { _ in
            
        }
        
        
        
    }


}

extension Endpoint {
    static func getUserBalance() -> Endpoint {
        return Endpoint(path: "/user/update-streamlabs-wallet",
                        method: .get, task: .requestPlain,
                        parametersEncoding: .query)
    }
}
