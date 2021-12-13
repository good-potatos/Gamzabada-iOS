import Foundation

// MARK: - Welcome

struct SnsLogin: Codable {
//    let data: String
    let data: SnsLoginData
    let message: String
    let success: Bool
}

// MARK: - DataClass

struct SnsLoginData: Codable {
    let accessToken, expiredTime, snsType: String
    let userInfo: UserInfo
}

// MARK: - UserInfo

struct UserInfo: Codable {
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
