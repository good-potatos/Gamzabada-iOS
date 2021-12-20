//
//  LoginViewModel.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Foundation
import KakaoSDKUser

class LoginViewModel {
    let usecase: LoginUsecase

    init(usecase _: LoginUsecase) {
        self.usecase = LoginUsecaseImpl()
    }

    func loginWithKakao() {
        self.usecase.loginWithKakao()
    }
}
