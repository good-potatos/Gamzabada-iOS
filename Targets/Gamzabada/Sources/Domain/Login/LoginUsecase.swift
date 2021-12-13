//
//  LoginUsecase.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine
import Foundation

class LoginUsecase {
    let repository: LoginRepository

    init(repository: LoginRepository = LoginRepositoryImpl()) {
        self.repository = repository
    }

    func fetchLoginSNS() -> AnyPublisher<UserInfo, NetworkError> {
        return self.repository.fetchSnsLogin()
            .map { $0.data.userInfo }
            .eraseToAnyPublisher()
    }
}
