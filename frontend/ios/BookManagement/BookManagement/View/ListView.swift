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
        List(bookViewModel.books, id:\.id) { item in
            ListItemView(book: item)
        }.onAppear {
            bookViewModel.getBooks()
        }
    }
}

#Preview {
    ListView()
}
