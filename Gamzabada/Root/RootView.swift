//
//  RootView.swift
//  Gamzabada
//
//  Created by Wimes on 2022/06/29.
//

import ComposableArchitecture
import MainTab
import MainTabInterface
import SwiftUI

struct RootView: View {
    let store: Store<RootState, RootAction>

    init(store: Store<RootState, RootAction>) {
        self.store = store
    }

    var body: some View {
        WithViewStore(self.store) { viewStore in
            SwitchStore(self.store) {
                CaseLet(
                    state: /RootState.loggedIn,
                    action: RootAction.loggedInAction
                ) { store in
                    MainTabView(store: store)
                }
            }
            .onAppear {
                viewStore.send(.loggedInAction(.onAppear))
            }
        }
    }
}

// struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//    }
// }
