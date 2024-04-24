//
//  DetailView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var bookViewModel: BookViewModel
    @Binding var showDetailView: Bool
    @Binding var selectedBook: Book
    @Binding var refreshBookList: Bool
    
    var bindingDate: Binding<Date> {
        Binding<Date>(
            get: {
                return selectedBook.publishedDate.toDate() ?? Date()
            }, set: {
                selectedBook.publishedDate = $0.toString()
            }
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Book detail")) {
                    TextField("Book Name", text: $selectedBook.title)
                    TextField("Book Author", text: $selectedBook.author)
                    TextField("Book ISBN", text: $selectedBook.isbn)
                }
                Section(header: Text("Book PublishedDate")) {
                    DatePicker("Published Date", selection: bindingDate, in: getLimitRange(), displayedComponents: [.date])
                                }
                Section{
                    Button {
                        if(bookViewModel.deleteBook(book: selectedBook)) {
                            showDetailView.toggle()
                            refreshBookList.toggle()
                        }
                        
                    } label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }.navigationTitle("Book Detail")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            showDetailView.toggle()
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            if(bookViewModel.updateBook(book: selectedBook)) {
                                showDetailView.toggle()
                                refreshBookList.toggle()
                            }
                        } label: {
                            Text("Update")
                        }
                        .disabled(selectedBook.title.isEmpty)
                    }
                }
        }
    }
}

#Preview {
    DetailView(
        bookViewModel: BookViewModel(),
        showDetailView: .constant(false),
        selectedBook: .constant(mockBook[0]),
        refreshBookList: .constant(false)
    )
}

