//
//  SnsLogin.swift
//
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

// MARK: - Welcome

public struct SnsLogin: Codable {
    public let data: SnsLoginData
    public let message: String
    public let success: Bool
}

// MARK: - DataClass

public struct SnsLoginData: Codable {
    public let accessToken, expiredTime: String
    public let snsType: String
    public let userInfo: UserInformation
}

// MARK: - UserInfo

public struct UserInformation: Codable {
    public let email: String
    public let id: Int
    public let name, nickname: String
    public let postOnSaleCount, postSoldCount: Int
    public let profileImageURL: String

    enum CodingKeys: String, CodingKey {
        case email, id, name, nickname, postOnSaleCount, postSoldCount
        case profileImageURL = "profileImageUrl"
    }
}
