//
//  RootState.swift
//  Gamzabada
//
//  Created by Wimes on 2022/06/29.
//

import ComposableArchitecture
import MainTabInterface

enum RootState: Equatable {
    case loggedIn(MainTabState)

    public init() { self = .loggedIn(.init(items: [])) }
}
