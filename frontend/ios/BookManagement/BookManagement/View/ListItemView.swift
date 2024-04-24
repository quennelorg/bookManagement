//
//  ListItemView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct ListItemView: View {
    var book: Book
    var body: some View {
        HStack {
            Image(systemName: "book.closed.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
                .foregroundColor(getRandomColor())
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title)
                HStack {
                    Text(book.author).font(.subheadline)
                    Spacer()
                    Text(book.publishedDate).font(.subheadline)
                }
                Text(book.isbn)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    ListItemView(book: mockBook[0])
}
