//
//  File.swift
//
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

// MARK: api통신에 있어서 dictionary <-> data 간의 parsing을 위함.

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }

    var data: Data? {
        return (try? JSON.encoder.encode(self))
    }
}

extension Data {
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: self)) as? [String: Any] ?? [:]
    }
}
