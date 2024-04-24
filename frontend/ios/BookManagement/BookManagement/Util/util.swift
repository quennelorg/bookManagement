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
