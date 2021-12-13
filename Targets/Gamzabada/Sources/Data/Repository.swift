//
//  Repository.swift
//  Gamzabada
//
//  Created by seokho on 2021/12/12.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import Combine
import Moya

enum NetworkError: Error {
    case REQUEST_FAIL
    case DECODING_FAIL
}

extension NetworkError {
    var description: String {
        switch self {
        case .REQUEST_FAIL:
            return "## request fail!"
        case .DECODING_FAIL:
            return "## decoding fail!"
        }
    }
}

protocol Fetchable {
    var provider: MoyaProvider<GamzabadaApi> { get set }
}

class Fetcher: Fetchable {
    var provider = MoyaProvider<GamzabadaApi>()

    func execute<T: Decodable>(id: GamzabadaApi) -> AnyPublisher<T, NetworkError> {
        return self.provider.requestPublisher(id)
            .mapError { _ -> NetworkError in .REQUEST_FAIL }
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ -> NetworkError in .DECODING_FAIL }
            .eraseToAnyPublisher()
    }
}

class Repository: Fetcher {
    func fetchSnsLogin(body: [String: String]) -> AnyPublisher<SnsLogin, NetworkError> {
        self.execute(id: .SNS_LOGIN(body))
            .map { $0 }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
