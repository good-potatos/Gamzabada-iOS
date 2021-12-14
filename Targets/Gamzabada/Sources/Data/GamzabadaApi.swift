//
//  GamzabadaApi.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Moya

protocol Body: Encodable {}

struct SnsLogin: Body {
    var accessToken: String
    var snsType: String
    var snsUserId: String
}

enum GamzabadaApi: TargetType {
    // https://api-test.takeapotato.com/swagger-ui/#/2.%20Posts
    case snsLogin(Body) // SNS LOGIN
    case myInfo // 내 정보 조회
    case registerAuth(Body) // 회원 등록(회원 가입)
    case user(Int) // 회원 조회
    case userPosts(Int) // 회원 게시글 조회
    case searchAllPosts // 전체 게시글 조회
    case searchSinglePost(Int) // 게시글 단건 조회
    case deletePost(Int) // 게시글 삭제
    case postLike(Int, Body) // 게시글 좋아요
    case searchMyPosts // 나의 게시글 조회
    case writePost(Body) // 새 게시글 작성
}

extension GamzabadaApi {
    var baseURL: URL {
        #if DEBUG
            return URL(string: "https://api-test.takeapotato.com")!
        #else
            return URL(string: "https://api-beat.takeapotato.com")!
        #endif
    }

    var path: String {
        switch self {
        case .snsLogin:
            return "/v1/auth/login/sns"
        case .myInfo:
            return "/v1/auth/me"
        case .registerAuth:
            return "/v1/auth/register"
        case let .user(id):
            return "/v1/user/\(id)"
        case let .userPosts(id):
            return "/v1/user/\(id)/posts"
        case .searchAllPosts:
            return "/v1/posts"
        case let .searchSinglePost(postId):
            return "/v1/posts/\(postId)"
        case let .deletePost(postId):
            return "/v1/posts/\(postId)"
        case let .postLike(postId, _):
            return "/v1/posts/\(postId)"
        case .searchMyPosts:
            return "/v1/posts/me"
        case .writePost:
            return "/v1/posts/wrtie"
        }
    }

    var method: Moya.Method {
        switch self {
        case .myInfo,
             .user,
             .userPosts,
             .searchAllPosts,
             .searchSinglePost,
             .searchMyPosts:
            return .get
        case .snsLogin,
             .registerAuth,
             .postLike,
             .writePost:
            return .post
        case .deletePost:
            return .delete
        }
    }

    var task: Task {
        switch self {
        case let .snsLogin(body):
            guard let body = body as? SnsLogin else {
                // MARK: To Do

                // throw error
                return .requestJSONEncodable(["": ""])
            }

            return .requestJSONEncodable(body.gamzaDictionaryConvert)

        // MARK: To Do

        // api 관련 parameter/body 정의 필요
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
