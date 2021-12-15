//
//  NetworkError.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/15.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case requestFail
    case decodingFail
}

extension NetworkError {
    var message: String {
        switch self {
        case .requestFail:
            return "## request fail!"
        case .decodingFail:
            return "## decoding fail!"
        }
    }
}
