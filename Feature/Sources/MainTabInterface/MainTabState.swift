//
//  MainTabState.swift
//
//
//  Created by Wimes on 2022/06/30.
//

import ComposableArchitecture
import MainTabInterface
import SwiftUI

public struct TabItem: Hashable {
    public static func == (lhs: TabItem, rhs: TabItem) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    private let id = UUID()

    public let view: AnyView
    public let icon: Image
    public let title: Text
}

public struct MainTabState: Equatable {
    public static func == (lhs: MainTabState, rhs: MainTabState) -> Bool {
        return lhs.id == rhs.id
    }

    private let id = UUID()
    public var items: [TabItem] = []

    public init(
        items: [(
            view: AnyView,
            icon: Image,
            title: Text
        )]
    ) {
        items.forEach { view, icon, title in
            self.items.append(TabItem(
                view: view,
                icon: icon,
                title: title
            ))
        }
    }
}
