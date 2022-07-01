//
//  MainTabReducer.swift
//
//
//  Created by Wimes on 2022/06/30.
//

import ComposableArchitecture
import MainTabInterface

public let mainTabReducer = Reducer<
    MainTabState,
    MainTabAction,
    MainTabEnvironment
>.combine(Reducer { _, action, _ in
    switch action {
    case .onAppear:
        return .none
    }
})
