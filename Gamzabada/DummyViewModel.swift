//
//  DummyViewModel.swift
//  Gamzabada
//
//  Created by Wimes on 2022/07/02.
//

import Foundation
import SwiftUI

final class DummyViewModel: ObservableObject {
    private var index: Int = 0
    @Published
    var date: Date = {
        let date = Date()
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        components.year = 0
        components.month = 0

        return calendar.date(from: components) ?? Date()
    }()

    @Published
    var color: Color = .red

    private var colors: [Color] = [.red, .green, .blue]

    init() {
        self.run()
    }

    private func run() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.date -= 1
            self.index += 1
            if self.index >= 3 {
                self.index = 0
            }
            self.color = self.colors[self.index]
        }
        RunLoop.current.add(timer, forMode: .common)
    }
}
