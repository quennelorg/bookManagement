//
//  util.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import Foundation
import SwiftUI

func getRandomColor() -> Color {
    let colors: [Color] = [.green, .blue, .orange, .yellow, .purple, .brown, .black, .gray]
    let randomIndex = Int.random(in: 0..<colors.count)
    return colors[randomIndex]
}

func getLimitRange() -> ClosedRange<Date> {
    let calendar = Calendar.current
    let currentDateComponent = calendar.dateComponents([.day, .month, .year], from: Date())
    let endDateComponent = DateComponents(year: currentDateComponent.year, month: currentDateComponent.month, day: currentDateComponent.day)
    let startDateComponent = DateComponents(year: 1800, month: 1, day: 1)
    
    return calendar.date(from: startDateComponent)!...calendar.date(from: endDateComponent)!
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
        let result = dateFormatter.string(from: self)
        return result
    }
}

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let result = dateFormatter.date(from: self)
        return result
    }
}
