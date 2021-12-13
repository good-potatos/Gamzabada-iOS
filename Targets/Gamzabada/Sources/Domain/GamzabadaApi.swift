//
//  GamzabadaApi.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/07.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Moya

enum GamzabadaApi: BaseTargetType {}
extension GamzabadaApi {
    var path: String {
        return ""
    }

    var method: Moya.Method {
        return .get
    }

    var headers: [String: String]? {
        return nil
    }

    var parameters: [String: Any]? {
        return nil
    }
}
