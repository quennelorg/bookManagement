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
