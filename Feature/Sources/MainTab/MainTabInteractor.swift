//
//  MainTabInteractor.swift
//
//
//  Created by Wimes on 2022/06/28.
//

import ComposableArchitecture
import SwiftUI

public struct TabItem: Hashable {
    public static func == (lhs: TabItem, rhs: TabItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    let id = UUID()
    
    let icon: Image
    let title: Text
    let view: AnyView
}

public struct MainTabState: Equatable {
    public static func == (lhs: MainTabState, rhs: MainTabState) -> Bool {
        return lhs.id == rhs.id
    }
    
    public init() {}
    let id = UUID()
    var items: [TabItem] = []
}

public enum MainTabAction {
    case onAppear
}

public struct MainTabEnvironment {}

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
