//
//  GamzabadaApp.swift
//  Gamzabada
//
//  Created by seokho on 2021/11/19.
//  Copyright © 2021 tuist.io. All rights reserved.
//

import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
import SwiftUI

@main
struct Gamzabadapp: App {
    let kakaoApiKey: String = "8795117bfe83425e3cd0f20a39d14091"

    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: self.kakaoApiKey)
    }

    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            }
        }
    }
}
