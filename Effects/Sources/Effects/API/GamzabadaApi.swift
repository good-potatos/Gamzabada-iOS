//
//  GamzabadaApi.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

enum GamzabadaApi: BaseTargetType{
    case snsLogin(body: SnsLoginBody)
}

extension GamzabadaApi{
    var path: String{
        switch self{
        case .snsLogin:
            return "/v1/auth/login/sns"
        }
    }
    
    var method: Method{
        switch self{
        case .snsLogin:
            return .post
        }
    }
    
    var queryParameter: [String : String]?{
        switch self{
        default:
            return nil
        }
    }
    
    var requestBody: Data?{
        switch self{
        case let .snsLogin(body):
            return body.data
        default:
            return nil
        }
    }
    
    var url: URL{UrlBuilder(object: self).url}
    
    var request: URLRequest{UrlRequestBuilder(object: self).urlRequest}
}
