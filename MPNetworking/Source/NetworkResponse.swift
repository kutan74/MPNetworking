//
//  NetworkResponse.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

public enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}