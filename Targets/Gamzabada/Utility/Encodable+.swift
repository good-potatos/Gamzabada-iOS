//
//  Encodable+.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Foundation

extension Encodable {
    var gamzaDictionaryConvert: [String: String] {
        let encoder = JSONEncoder()

        return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: String] ?? [:]
    }

//    subscript(key: String) -> Any?{
//        dictionary[key]
//    }
}
