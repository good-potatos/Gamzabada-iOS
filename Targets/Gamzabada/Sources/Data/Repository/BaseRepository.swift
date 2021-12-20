//
//  BaseRepository.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine
import Moya

class BaseRepository {
    let provider = MoyaProvider<GamzabadaApi>()

    func execute<T: Decodable>(api: GamzabadaApi) -> AnyPublisher<T, NetworkError> {
        return self.provider
            .requestPublisher(api)
            .filterSuccessfulStatusCodes()
            .mapError { _ -> NetworkError in .requestFail }
            .flatMap {
                Just($0.data)
                    .decode(type: T.self, decoder: JSONDecoder())
                    .mapError { _ -> NetworkError in .decodingFail }
            }
            .eraseToAnyPublisher()
    }
}
