//
//  Task.swift
//  MPNetworking
//
//  Created by KUTAN ÇINGISIZ on 20.07.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//


/// Public typealias representing [String: Any]
public typealias Parameters = [String: Any]
public typealias RawBodyParameter = Data

// MARK: Task

public enum Task {
    case requestPlain
    case requestParameters(Parameters)
    case requestRawBody(RawBodyParameter)
}
