//
//  ListView.swift
//  BookManagement
//
//  Created by Xinyu Ji on 2024/4/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List(mockBook, id:\.id) { item in
            ListItemView(book: item)
        }
    }
}

#Preview {
    ListView()
}
