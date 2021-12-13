//
//  Repository.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine
import Foundation
import Moya

// MARK: To Do

// Error 관련해서 설계가 필요해 보임
enum NetworkError: Error {
    case requestFail
    case decodingFail
}

extension NetworkError {
    var message: String {
        switch self {
        case .requestFail:
            return "## request fail!"
        case .decodingFail:
            return "## decoding fail!"
        }
    }
}

class BaseRepository {
    var provider = MoyaProvider<GamzabadaApi>()

    func execute<T: Decodable>(id: GamzabadaApi) -> AnyPublisher<T, NetworkError> {
        return self.provider.requestPublisher(id)
            .mapError { _ -> NetworkError in .requestFail }
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ -> NetworkError in .decodingFail }
            .eraseToAnyPublisher()
    }
}

protocol LoginRepository {
    func fetchSnsLogin() -> AnyPublisher<SnsLogin, NetworkError>
}

class LoginRepositoryImpl: BaseRepository, LoginRepository {
    func fetchSnsLogin() -> AnyPublisher<SnsLogin, NetworkError> {
        self.execute(id: .snsLogin)
    }
}
