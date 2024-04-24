//
//  ListView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var bookViewModel: BookViewModel = BookViewModel()
    
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
                      print("add")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }


    }
}

#Preview {
    ListView()
}
