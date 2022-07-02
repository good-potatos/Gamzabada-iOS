//
//  String+.swift
//
//
//  Created by Wimes on 2022/07/01.
//

import Foundation

public extension String {
    var priceFormat: String {
        guard let value = Double(self) else { return "" }

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: value) ?? ""
    }
}
