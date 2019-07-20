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

struct TransactionContainer: Codable {
    var code: Int
    var error: Bool
    var message: String?
    var data: TransactionData!
}

struct TransactionData: Codable {
    var content: [Transaction]
}

struct Transaction: Codable {
    var amount: Double?
    var creationDate: String?
    var direction: String?
    var id: Int?
    var partyId: String?
    var partyName: String?
    var partyType: String?
    //var product: String?
    var quantity: String?
    var transactionId: String?
    var transactionCode: String?
    var username: String?
    //var wallet: Int?
    var partyProfilePhoto: String?
    var description: String?
    var status: String?
    var type: String?
}
