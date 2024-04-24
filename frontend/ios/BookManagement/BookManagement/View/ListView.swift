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
    
    var body: some View {
        NavigationView {
            List(bookViewModel.books, id:\.id) { item in
                ListItemView(book: item)
            }.onAppear {
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
        }


    }
}

#Preview {
    ListView()
}
