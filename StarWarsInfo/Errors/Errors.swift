//
//  Errors.swift
//  StarWarsInfo
//
//  Created by curtis scott on 20/08/2019.
//  Copyright © 2019 CurtisScott. All rights reserved.
//

import Foundation


enum JsonConnectionError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}


