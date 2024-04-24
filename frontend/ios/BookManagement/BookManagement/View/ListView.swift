//
//  ListView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var bookViewModel: BookViewModel = BookViewModel()
    @State private var showAddBookView: Bool = false
    @State private var refreshBookList: Bool = false
    @State private var showDetailView: Bool = false
    @State private var selectedBook: Book = Book(id: "1", title: "", author: "", isbn: "", publishedDate: "")
    
    var body: some View {
        NavigationView {
            List(bookViewModel.books, id:\.id) { item in
                ListItemView(book: item)
                    .onTapGesture {
                        selectedBook = item
                        showDetailView.toggle()
                    }
            }
            .onAppear {
                bookViewModel.getBooks()
            }
            .onChange(of: refreshBookList) { oldState, newState in
                bookViewModel.getBooks()
            }
            .listStyle(.plain)
            .navigationTitle("My Books")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddBookView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddBookView, content: {
                AddBookView(
                    bookViewModel: bookViewModel,
                    showAddBookView: $showAddBookView,
                    refreshBookList: $refreshBookList
                )
            })
            .sheet(isPresented: $showDetailView, content: {
                DetailView(
                    bookViewModel: bookViewModel,
                    showBookDetailView: $showDetailView,
                    selectedBook: $selectedBook,
                    refreshBookList: $refreshBookList
                )
            })
        }


    }
}

#Preview {
    ListView()
}
