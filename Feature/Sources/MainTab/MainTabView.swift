//
//  MainTabView.swift
//
//
//  Created by Wimes on 2022/06/28.
//

import ComposableArchitecture
import SwiftUI

public struct MainTabView: View {
    let store: Store<MainTabState, MainTabAction>

    public var body: some View {
        WithViewStore(self.store) { _ in
            TabView {}
        }
    }
}
