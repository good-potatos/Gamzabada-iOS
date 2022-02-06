//
//  File.swift
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
