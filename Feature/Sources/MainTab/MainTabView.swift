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
        WithViewStore(self.store) { viewStore in
            TabView {
                ForEach(viewStore.state.items, id: \.self) { item in
                    item.view
                        .tabItem {
                            item.icon
                            item.title
                        }
                }
            }
        }
    }
}
