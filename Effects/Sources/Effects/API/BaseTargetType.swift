//
//  BaseTargetType.swift
//
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

protocol BaseTargetType {
    var request: URLRequest { get }
    var queryParameter: [String: String]? { get }
    var path: String { get }
    var requestBody: Data? { get }
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

    var url: URL {
        var components = URLComponents()

        components.scheme = "https"
        components.host = self.baseUrl
        components.path = self.path
        components.queryItems = []

        self.queryParameter?.forEach {
            components.queryItems?.append(URLQueryItem(name: $0.key, value: $0.value))
        }

        if let url = components.url {
            return url
        } else {
            return URL(string: "")!
        }
    }

    var request: URLRequest {
        var request = URLRequest(url: self.url)

        self.header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        if let requestBody = self.requestBody {
            request.httpBody = requestBody
        }

        return request
    }
}

enum Method: String {
    case get
    case post
}
