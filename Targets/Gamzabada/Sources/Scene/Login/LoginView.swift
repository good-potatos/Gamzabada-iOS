//
//  LoginView.swift
//  Gamzabada
//
//  Created by Wimes on 2021/12/13.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        Button {
            self.viewModel.snsLogin()
        } label: {
            Text("sns login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
