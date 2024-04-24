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
        let id = UUID().uuidString.replacingOccurrences(of: "-", with: "")
        let newBook = Book(id: id, title: book.title, author: book.author, isbn: book.isbn, publishedDate: book.publishedDate)
        tempBook.append(newBook)
        return true
    }
    
    func updateBook(book: Book) -> Bool {
        if let index = tempBook.firstIndex(where: {$0.id == book.id}) {
            
            tempBook[index].title = book.title
            tempBook[index].author = book.description
            tempBook[index].isbn = book.isbn
            tempBook[index].publishedDate = book.publishedDate
            
            return true
        }
        return false
    }
    
    func deleteBook(book: Book) -> Bool {
        if let index = tempBook.firstIndex(where: {$0.id == book.id}) {
            tempBook.remove(at: index)
            return true
        }
        return false
    }
}
