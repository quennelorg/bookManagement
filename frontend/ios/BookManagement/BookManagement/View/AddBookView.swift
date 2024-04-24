//
//  AddBookView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct AddBookView: View {
    
    @StateObject var bookViewModel: BookViewModel
    @State private var newBook: Book = Book(id: "", title: "", author: "", isbn: "", publishedDate: Date().toString())
    
    var bindingDate: Binding<Date> {
        Binding<Date>(
            get: {
                return newBook.publishedDate.toDate() ?? Date()
            }, set: {
                newBook.publishedDate = $0.toString()
            }
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Book detail")) {
                    TextField("Please input Book title", text: $newBook.title)
                    TextField("Please input Book author", text: $newBook.author)
                    TextField("Please input Book ISBN", text: $newBook.isbn)
                }
                Section(header: Text("Book PublishedDate")) {
                    DatePicker("Published Date", selection: bindingDate, displayedComponents: [.date])
                }
            }.navigationTitle("Add Book")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            print("cancel")
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                           print("add")
                        } label: {
                            Text("Add")
                        }.disabled(newBook.title.isEmpty)
                    }
                }
        }
        
    }
}

#Preview {
    AddBookView(bookViewModel: BookViewModel())
}
