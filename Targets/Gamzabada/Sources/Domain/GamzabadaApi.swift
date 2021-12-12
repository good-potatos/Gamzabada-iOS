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
    
    // MARK: health check
    case HEALTH_CHECK // 헬스 체크
    
    // MARK: Auth
    case SNS_LOGIN // SNS LOGIN
    case MY_INFO // 내 정보 조회
    case REGISTER_AUTH // 회원 등록(회원 가입)
    
    // MARK: User
    case USER(Int) // 회원 조회
    case USER_POSTS(Int) // 회원 게시글 조회
    
    // MARK: Posts
    case SEARCH_ALL_POSTS // 전체 게시글 조회
    case SEARCH_SINGLE_POST(Int) // 게시글 단건 조회
    case DELETE_POST(Int) // 게시글 삭제
    case POST_LIKE(Int) // 게실 좋아요
    case SEARCH_MY_POSTS // 나의 게실 조회
    case WRTIE_POST // 새 게시글 작성
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
        switch self{
        case .HEALTH_CHECK:
            return "/poing"
            
        case .SNS_LOGIN:
            return "/v1/auth/login/sns"
        case .MY_INFO:
            return "/v1/auth/me"
        case .REGISTER_AUTH:
            return "/v1/auth/register"
            
        case .USER(let id):
            return "/v1/user/\(id)"
        case .USER_POSTS(let id):
            return "/v1/user/\(id)/posts"
            
        case .SEARCH_ALL_POSTS:
            return "/v1/posts"
        case .SEARCH_SINGLE_POST(let postId):
            return "/v1/posts/\(postId)"
        case .DELETE_POST(let postId):
            return "/v1/posts/\(postId)"
        case .POST_LIKE(let postId):
            return "/v1/posts/\(postId)"
        case .SEARCH_MY_POSTS:
            return "/v1/posts/me"
        case .WRTIE_POST:
            return "/v1/posts/wrtie"
        }
    }

    var method: Moya.Method {
        switch self{
            // MARK: GET
        case .HEALTH_CHECK,
                .MY_INFO,
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
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
