//
//  UserContainer.swift
//  Examples
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct UserContainer: Codable {
    var data: User
}

struct User: Codable {
    var accessToken: String
    var idToken: String
    var refreshToken: String
}
