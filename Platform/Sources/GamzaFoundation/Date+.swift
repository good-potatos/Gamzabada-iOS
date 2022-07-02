//
//  Date+.swift
//
//
//  Created by Wimes on 2022/07/02.
//

import Foundation

public extension Date {
    var countDownString: String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d일 H시간 m분 s초"
        if day <= 0 {
            dateFormatter.dateFormat = "H시간 m분 s초"
            if hour <= 0 {
                dateFormatter.dateFormat = "m분 s초"
                if minute <= 0 {
                    dateFormatter.dateFormat = "s초"
                }
            }
        }

        return dateFormatter.string(from: self)
    }
}
