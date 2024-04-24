//
//  Book.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import Foundation

struct Book: Codable {
    var id: String
    var title: String
    var author: String
    var isbn: String
    var publishedDate: String
}

let mockBook: [Book] = [
    Book(id: "1", title: "test1", author: "test1", isbn: "test1", publishedDate: "test1"),
    Book(id: "2", title: "test2", author: "test2", isbn: "test2", publishedDate: "test2"),
    Book(id: "3", title: "test3", author: "test3", isbn: "test3", publishedDate: "test3")
]
