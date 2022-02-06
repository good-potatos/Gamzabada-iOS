//
//  UrlBuilder.swift
//
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

struct UrlBuilder {
    var object: GamzabadaApi

    var url: URL {
        var components = URLComponents()

        components.scheme = "https"
        components.host = self.object.baseUrl
        components.path = self.object.path
        components.queryItems = []

        self.object.queryParameter?.forEach {
            components.queryItems?.append(URLQueryItem(name: $0.key, value: $0.value))
        }

        return components.url!
    }
}
