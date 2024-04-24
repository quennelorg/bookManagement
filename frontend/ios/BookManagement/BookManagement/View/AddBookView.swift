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
    @Binding var showAddBookView: Bool
    @Binding var refreshBookList: Bool
    @State private var showDirtyCheckAlert: Bool = false
    
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
                            if(!newBook.title.isEmpty) {
                                showDirtyCheckAlert.toggle()
                            } else {
                                showAddBookView.toggle()
                            }
                        } label: {
                            Text("Cancel")
                        }.alert("Save Book", isPresented: $showDirtyCheckAlert) {
                            Button {
                                showAddBookView.toggle()
                            } label: {
                                Text("Cancel")
                            }
                            Button {
                                addBook()
                            } label: {
                                Text("Save")
                            }
                        } message: {
                            Text("Could you like to save the book?")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                           addBook()
                        } label: {
                            Text("Add")
                        }.disabled(newBook.title.isEmpty)
                    }
                }
        }
        
    }
    private func addBook() {
        if(bookViewModel.addBook(book: newBook)) {
            showAddBookView.toggle()
            refreshBookList.toggle()
        }
    }
}

#Preview {
    AddBookView(bookViewModel: BookViewModel(), showAddBookView: .constant(false), refreshBookList: .constant(false))
}
