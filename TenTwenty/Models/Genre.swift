//
//  Genre.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import Foundation

// MARK: - Genre
struct Genre: Codable {
	let genres: [GenreElement]
}

// MARK: - GenreElement
struct GenreElement: Codable {
	let id: Int
	let name: String
}
