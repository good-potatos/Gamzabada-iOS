//
//  GamzabadaApi.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/07.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Moya

enum GamzabadaApi: TargetType {}
extension GamzabadaApi {
    var baseURL: URL {
        #if DEBUG
            return URL(string: "https://api-test.takeapotato.com")!
        #else
            return URL(string: "https://api-beat.takeapotato.com")!
        #endif
    }

    var path: String {
        return ""
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }
}
