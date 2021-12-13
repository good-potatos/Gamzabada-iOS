//
//  GamzabadaApi.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/07.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Moya

enum GamzabadaApi: TargetType {
    // https://api-test.takeapotato.com/swagger-ui/#/2.%20Posts

    // MARK: Auth

    case SNS_LOGIN([String: String]) // SNS LOGIN
    case MY_INFO // 내 정보 조회
    case REGISTER_AUTH([String: String]) // 회원 등록(회원 가입)

    // MARK: User

    case USER(Int) // 회원 조회
    case USER_POSTS(Int) // 회원 게시글 조회

    // MARK: Posts

    case SEARCH_ALL_POSTS // 전체 게시글 조회
    case SEARCH_SINGLE_POST(Int) // 게시글 단건 조회
    case DELETE_POST(Int) // 게시글 삭제
    case POST_LIKE(Int, [String: String]) // 게실 좋아요
    case SEARCH_MY_POSTS // 나의 게실 조회
    case WRTIE_POST([String: String]) // 새 게시글 작성
}

extension GamzabadaApi {
    var baseURL: URL {
        #if DEBUG
            return URL(string: "https://api-test.takeapotato.com")!
        #else
            return URL(string: "https://api-test.takeapotato.com")!
        #endif
    }

    var path: String {
        switch self {
        case .SNS_LOGIN:
            return "/v1/auth/login/sns"
        case .MY_INFO:
            return "/v1/auth/me"
        case .REGISTER_AUTH:
            return "/v1/auth/register"

        case let .USER(id):
            return "/v1/user/\(id)"
        case let .USER_POSTS(id):
            return "/v1/user/\(id)/posts"

        case .SEARCH_ALL_POSTS:
            return "/v1/posts"
        case let .SEARCH_SINGLE_POST(postId):
            return "/v1/posts/\(postId)"
        case let .DELETE_POST(postId):
            return "/v1/posts/\(postId)"
        case let .POST_LIKE(postId, _):
            return "/v1/posts/\(postId)"
        case .SEARCH_MY_POSTS:
            return "/v1/posts/me"
        case .WRTIE_POST:
            return "/v1/posts/wrtie"
        }
    }

    var method: Moya.Method {
        switch self {
            // MARK: GET

        case .MY_INFO,
             .USER,
             .USER_POSTS,
             .SEARCH_ALL_POSTS,
             .SEARCH_SINGLE_POST,
             .SEARCH_MY_POSTS:
            return .get

            // MARK: POST

        case .SNS_LOGIN,
             .REGISTER_AUTH,
             .POST_LIKE,
             .WRTIE_POST:
            return .post

            // MARK: DELETE

        case .DELETE_POST:
            return .delete
        }
    }

    var task: Task {
        switch self {
        case let .SNS_LOGIN(body),
             let .REGISTER_AUTH(body),
             let .POST_LIKE(_, body),
             let .WRTIE_POST(body):
            return .requestJSONEncodable(body)

        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
