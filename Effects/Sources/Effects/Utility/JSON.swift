//
//  File.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

// MARK: To-Do
// Utility package로 따로 빼놓자
struct JSON{
    static let encoder = JSONEncoder()
}

extension Encodable{
    var dictionary: [String: Any]{
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
    
    var data: Data?{
        return (try? JSON.encoder.encode(self))
    }
    
    subscript(key: String) -> Any?{
        return dictionary[key]
    }
}

extension Data{
    var dictionary: [String: Any]{
        return (try? JSONSerialization.jsonObject(with: self)) as? [String: Any] ?? [:]
    }
}
