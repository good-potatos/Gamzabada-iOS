//
//  MainTabInteractor.swift
//
//
//  Created by Wimes on 2022/06/28.
//

import ComposableArchitecture

struct MainTabState: Equatable {}

struct MainTabAction {}

struct MainTabEnvironment {}

let mainTabReducer = Reducer<
    MainTabState,
    MainTabAction,
    MainTabEnvironment
>.combine(Reducer { _, action, _ in
    switch action {
    default:
        return .none
    }
})
