//
//  LoginUsecase.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine
import Foundation

import KakaoSDKAuth
import KakaoSDKUser

protocol LoginUsecase {
    func fetchLoginSNS(body: SnsLoginBody) -> AnyPublisher<Result<SnsLogin, NetworkError>, Never>
    func loginWithKakao() -> AnyPublisher<Result<OAuthToken, LoginError>, Never>
}

enum LoginError: Error {
    case kakao
}

extension LoginError {
    var message: String {
        switch self {
        case .kakao:
            return "kakao fail"
        }
    }
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

    func loginWithKakao() -> AnyPublisher<Result<OAuthToken, LoginError>, Never> {
        // 카카오톡 설치 여부 확인
        Just(UserApi.isKakaoTalkLoginAvailable())
            .map{ _ in
                self.authenticateWithKakao
            }
            .eraseToAnyPublisher()
    }

    func authenticateWithKakao() -> AnyPublisher<Result<OAuthToken, LoginError>, Never> {
        Future<OAuthToken, LoginError> { promise in
            UserApi.shared.loginWithKakaoAccount(prompts: [.Login]) { oAuthToken, error in
                if let error = error {
                    promise(.failure(.kakao))
                    return
                }
                promise(.success(oAuthToken))
            }
        }
        .eraseToAnyPublisher()
    }
}
