//
//  Book.swift
//  BookListComposableArchitecture
//
//  Created by Guilherme Ferreira Lenzolari on 14/03/24.
//

import Foundation

struct Book: Codable, Equatable {
    let url: String
    let name, isbn: String
    let authors: [String]
    let numberOfPages: Int
    let publisher: String
    let country: String
    let mediaType, released: String
    let characters, povCharacters: [String]
}
