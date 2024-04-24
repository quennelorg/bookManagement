//
//  ViewModel.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import Foundation

final class BookViewModel: ObservableObject {
    static let url = URL(string: "http://54.252.157.217:8080/book")!
    @Published var books: [Book] = []
    
    private var tempBook: [Book] = []
    
    func getBooks() {
        var request = URLRequest.init(url: BookViewModel.url, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Book].self, from: data)
                DispatchQueue.main.async {
                    self?.books = result
                }
            } catch {
                print("Error decoding books: \(error.localizedDescription)")}
        }.resume()
    }
    
    func addBook(book: Book) -> Bool {
        let id = UUID().uuidString.replacingOccurrences(of: "-", with: "")
        let newBook = Book(id: id, title: book.title, author: book.author, isbn: book.isbn, publishedDate: book.publishedDate)
        
        var request = URLRequest.init(url: BookViewModel.url, timeoutInterval: 10)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(newBook)
        URLSession.shared.dataTask(with: request) { [weak self] _, _, error in
                    if let error = error {
                        print("Error adding book: \(error.localizedDescription)")
                    } else {
                        DispatchQueue.main.async {
                            self?.getBooks()
                        }
                    }
        }.resume()
        return true
    }
    
    func updateBook(book: Book) -> Bool {
        var request = URLRequest.init(url: BookViewModel.url, timeoutInterval: 10)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(book)
        URLSession.shared.dataTask(with: request) { [weak self] _, _, error in
                    if let error = error {
                        print("Error Updating book: \(error.localizedDescription)")
                    } else {
                        DispatchQueue.main.async {
                            self?.getBooks()
                        }
                    }
        }.resume()
        return true
    }
    
    func deleteBook(book: Book) -> Bool {
        var request = URLRequest.init(url: BookViewModel.url, timeoutInterval: 10)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.url?.append(queryItems: [URLQueryItem(name: "id", value: book.id)])
        URLSession.shared.dataTask(with: request) { [weak self] _, _, error in
                    if let error = error {
                        print("Error Updating book: \(error.localizedDescription)")
                    } else {
                        DispatchQueue.main.async {
                            self?.getBooks()
                        }
                    }
        }.resume()
        return true
    }
}
