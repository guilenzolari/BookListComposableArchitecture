//
//  ContentView.swift
//  BookListComposableArchitecture
//
//  Created by Guilherme Ferreira Lenzolari on 14/03/24.
//

import SwiftUI
import ComposableArchitecture

struct BookListView: View {
    let store: StoreOf<BookListReducer>
    
    var body: some View {
        NavigationView{
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                List{
                    if let books = viewStore.books {
                        ForEach(books, id: \.isbn) { book in
                            Text(book.name)
                        }
                    } else {
                        Text("Book list is empty, refresh the page.")
                    }
                }
                .navigationTitle("Books")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewStore.send(.fetchBooks)
                        } label: {
                            Text("refresh")
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    BookListView(store: Store(initialState: BookListReducer.State(), reducer: {
        BookListReducer()
    }))
}
