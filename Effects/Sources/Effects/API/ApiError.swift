//
//  ApiError.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

// MARK: To-Do
// 나중에 ApiError뿐만 아니라 App에서 발생할 수 있는 Error 설계가 필요하다.
public enum ApiError: Error{
    case network
    case parsing
    case badRequest(body: [String:Any])
    case unknown
}

extension ApiError{
    public var description: String{
        switch self{
        case .network:
            return "Request to API Server failed"
        case .badRequest(let body):
            return body.description
        default:
            return self.localizedDescription
        }
    }
}
