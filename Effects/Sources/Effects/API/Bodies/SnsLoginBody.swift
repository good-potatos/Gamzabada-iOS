//
//  SnsLoginBody.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

public struct SnsLoginBody: Encodable {
    public init(
        accessToken: String,
        snsType: String,
        snsUserId: String
    ){
        self.accessToken = accessToken
        self.snsType = snsType
        self.snsUserId = snsUserId
    }
    var accessToken: String
    var snsType: String
    var snsUserId: String
}

//extension SnsLoginBody{
//    var toDictionary: [String: Any]{
//        let mirror = Mirror(reflecting: self)
//        var dictionary = [String: Any]()
//        mirror.children.forEach{dictionary[$0.label!] = $0.value}
//
//        return dictionary
//    }
//}
