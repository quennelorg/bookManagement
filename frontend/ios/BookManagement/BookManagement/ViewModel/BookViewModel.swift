//
//  ViewModel.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import Foundation

final class BookViewModel: ObservableObject {
    @Published var books: [Book] = []
    
    private var tempBook: [Book] = []
    
    func getBooks() {
        books = tempBook
    }
    
    func addBook(book: Book) -> Bool {
        tempBook.append(book)
        return true
    }
}
