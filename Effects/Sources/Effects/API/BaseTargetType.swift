//
//  BaseTargetType.swift
//
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

protocol BaseTargetType {
    var request: URLRequest { get }
    var url: URL { get }

    var queryParameter: [String: String]? { get }
}

extension BaseTargetType {
    var baseUrl: String {
        #if DEBUG
            return "api-test.takeapotato.com"
        #else
            return "takeapotato.com"
        #endif
        
    }

    var header: [String: String] {
        return [
            "Content-Type": "application/json",
        ]
    }
}

enum Method: String {
    case get
    case post
}
