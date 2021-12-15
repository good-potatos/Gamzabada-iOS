//
//  SnsLogin.swift.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Foundation

// MARK: - Welcome

struct SnsLogin: Codable {
    let data: SnsLoginData
    let message: String
    let success: Bool
}

// MARK: - DataClass

struct SnsLoginData: Codable {
    let accessToken, expiredTime: String
    let snsType: String
    let userInfo: UserInformation
}

// MARK: - UserInfo

struct UserInformation: Codable {
    let email: String
    let id: Int
    let name, nickname: String
    let postOnSaleCount, postSoldCount: Int
    let profileImageURL: String

    enum CodingKeys: String, CodingKey {
        case email, id, name, nickname, postOnSaleCount, postSoldCount
        case profileImageURL = "profileImageUrl"
    }
}
