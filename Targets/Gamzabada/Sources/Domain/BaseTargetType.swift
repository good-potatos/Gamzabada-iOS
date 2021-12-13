//
//  BaseTargetType.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Moya

protocol BaseTargetType: TargetType {
    var parameters: [String: Any]? { get }
}

extension BaseTargetType {
    var baseURL: URL {
        #if DEBUG
            return URL(string: "https://api-test.takeapotato.com")!
        #else
            return URL(string: "https://api-beat.takeapotato.com")!
        #endif
    }

    var task: Task {
        let parameters = self.parameters ?? [:]

        switch method {
        case .get:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        default:
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
}
