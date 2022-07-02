//
//  CellSummaryView.swift
//
//
//  Created by Wimes on 2022/07/01.
//

import GamzaFoundation
import SwiftUI

public struct CellSummaryView: View {
    private let title: String
    private let price: String
    @Binding
    private var remainingTime: Date
    @Binding
    private var remainingTimeColor: Color

    public init(
        title: String,
        price: String,
        remainingTime: Binding<Date>,
        remainingTimeColor: Binding<Color>
    ) {
        self.title = title
        self.price = price
        self._remainingTime = remainingTime
        self._remainingTimeColor = remainingTimeColor
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text(self.title)
                    .font(GamzaUIKit.Font.size16)
                Text("시작가격 " + self.price.priceFormat)
                    .foregroundColor(GamzaUIKit.Color.pointColor)
                    .font(GamzaUIKit.Font.size14)
                Text(self.remainingTime.countDownString)
                    .foregroundColor(self.remainingTimeColor)
                    .font(GamzaUIKit.Font.size12)
            }
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
        }
    }
}
