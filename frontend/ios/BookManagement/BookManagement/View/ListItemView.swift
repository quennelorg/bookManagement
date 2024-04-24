//
//  ListItemView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct ListItemView: View {
    var body: some View {
        HStack {
            Image(systemName: "book.closed.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding()
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text("12")
                    .font(.title)
                HStack {
                    Text("123").font(.subheadline)
                    Spacer()
                    Text("1234").font(.subheadline)
                }
                Text("isbn")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    ListItemView()
}
