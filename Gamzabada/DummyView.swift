//
//  DummyView.swift
//  Gamzabada
//
//  Created by Wimes on 2022/07/01.
//

import GamzaUIKit
import SwiftUI

struct DummyView: View {
    @ObservedObject
    var dummyViewModel = DummyViewModel()

    var body: some View {
        ProductSummaryView(
            title: "MyProduct",
            price: "1000000",
            remainingTime: self.$dummyViewModel.date,
            remainingTimeColor: self.$dummyViewModel.color
        )
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
