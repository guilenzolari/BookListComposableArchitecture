//
//  BookListComposableArchitectureApp.swift
//  BookListComposableArchitecture
//
//  Created by Guilherme Ferreira Lenzolari on 14/03/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct BookListComposableArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView(store: Store(initialState: BookListReducer.State(), reducer: {
                BookListReducer()
            }))        }
    }
}
