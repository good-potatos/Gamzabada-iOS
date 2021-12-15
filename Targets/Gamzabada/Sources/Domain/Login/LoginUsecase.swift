//
//  LoginUsecase.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine
import Foundation

protocol LoginUsecase {
    func fetchLoginSNS(body: SnsLoginBody) -> AnyPublisher<Result<SnsLogin, NetworkError>, Never>
}

class LoginUsecaseImpl: LoginUsecase {
    let repository: LoginRepository

    init(repository: LoginRepository = LoginRepositoryImpl()) {
        self.repository = repository
    }

    func fetchLoginSNS(body: SnsLoginBody) -> AnyPublisher<Result<SnsLogin, NetworkError>, Never> {
        return self.repository
            .fetchSnsLogin(body: body)
            .mapToResult()
            .eraseToAnyPublisher()
    }
}
