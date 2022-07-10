//
//  GamzabadaApp.swift
//  Gamzabada
//
//  Created by Milkyo on 2022/06/15.
//

import ComposableArchitecture
import SwiftUI

@main
struct GamzabadaApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(
                initialState: RootState(),
                reducer: rootReducer,
                environment: RootEnvironment()
            ))
        }
    }
}
