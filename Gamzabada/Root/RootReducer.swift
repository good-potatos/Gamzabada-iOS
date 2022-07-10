//
//  RootReducer.swift
//  Gamzabada
//
//  Created by Wimes on 2022/07/01.
//

import ComposableArchitecture
import MainTabInterface
import SwiftUI

let rootReducer = Reducer<
    RootState,
    RootAction,
    RootEnvironment
>.combine(Reducer { state, action, _ in
    switch action {
    case .loggedInAction(.onAppear):
        let mainTabState = MainTabState(
            items: [
                (
                    view: AnyView(DummyView()),
                    icon: Image(systemName: "list.dash"),
                    title: Text("A")
                ),
                (
                    view: AnyView(DummyView2()),
                    icon: Image(systemName: "list.dash"),
                    title: Text("B")
                ),
            ]
        )
        state = .loggedIn(mainTabState)
        return .none
    }
})
