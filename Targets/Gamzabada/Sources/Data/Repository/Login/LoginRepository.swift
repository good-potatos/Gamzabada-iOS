//
//  LoginRepository.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/15.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine
import Foundation

protocol LoginRepository {
    func fetchSnsLogin(body: SnsLoginBody) -> AnyPublisher<SnsLogin, NetworkError>
}

class LoginRepositoryImpl: BaseRepository, LoginRepository {
    func fetchSnsLogin(body: SnsLoginBody) -> AnyPublisher<SnsLogin, NetworkError> {
        return self.execute(api: .snsLogin(body: body))
    }
}
