//
//  GamzabadaApi.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//
// https://api-test.takeapotato.com/swagger-ui/#/2.%20Posts

import Moya

struct SnsLoginBody {
    var accessToken: String
    var snsType: String
    var snsUserId: String
}

enum GamzabadaApi: BaseTargetType {
    case snsLogin(body: SnsLoginBody) // SNS LOGIN
    case myInfo // 내 정보 조회
    case registerAuth // 회원 등록(회원 가입)
    case user(Int) // 회원 조회
    case userPosts(Int) // 회원 게시글 조회
    case searchAllPosts // 전체 게시글 조회
    case searchSinglePost(Int) // 게시글 단건 조회
    case deletePost(Int) // 게시글 삭제
    case postLike(Int) // 게시글 좋아요
    case searchMyPosts // 나의 게시글 조회
    case writePost // 새 게시글 작성
}

extension GamzabadaApi {
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
        case let .postLike(postId):
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

    var parameters: [String: Any]? {
        switch self {
        case let .snsLogin(body):
            return ["accessToken": body.accessToken, "snsType": body.snsType, "snsUserId": body.snsUserId]
        default:
            return nil
        }
    }
}
