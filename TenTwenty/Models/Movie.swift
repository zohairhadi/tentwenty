//
//  Movie.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Movie
struct Movie: Codable {
	let adult: Bool
	let backdropPath: String
	let belongsToCollection: JSONNull?
	let budget: Int
	let genres: [GenreElement]
	let homepage: String
	let id: Int
	let imdbID, originalLanguage, originalTitle, overview: String
	let popularity: Double
	let posterPath: String
	let productionCompanies: [ProductionCompany]
	let productionCountries: [ProductionCountry]
	let releaseDate: String
	let revenue, runtime: Int
	let spokenLanguages: [SpokenLanguage]
	let status, tagline, title: String
	let video: Bool
	let voteAverage: Double
	let voteCount: Int
	let videos: Videos

	enum CodingKeys: String, CodingKey {
		case adult
		case backdropPath = "backdrop_path"
		case belongsToCollection = "belongs_to_collection"
		case budget, genres, homepage, id
		case imdbID = "imdb_id"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case overview, popularity
		case posterPath = "poster_path"
		case productionCompanies = "production_companies"
		case productionCountries = "production_countries"
		case releaseDate = "release_date"
		case revenue, runtime
		case spokenLanguages = "spoken_languages"
		case status, tagline, title, video
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
		case videos = "videos"
	}
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseGenre { response in
//     if let genre = response.result.value {
//       ...
//     }
//   }

//// MARK: - Genre
//struct Genre: Codable {
//	let id: Int
//	let name: String
//}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProductionCompany { response in
//     if let productionCompany = response.result.value {
//       ...
//     }
//   }

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
	let id: Int
	let logoPath: String?
	let name, originCountry: String

	enum CodingKeys: String, CodingKey {
		case id
		case logoPath = "logo_path"
		case name
		case originCountry = "origin_country"
	}
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProductionCountry { response in
//     if let productionCountry = response.result.value {
//       ...
//     }
//   }

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
	let iso3166_1, name: String

	enum CodingKeys: String, CodingKey {
		case iso3166_1 = "iso_3166_1"
		case name
	}
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSpokenLanguage { response in
//     if let spokenLanguage = response.result.value {
//       ...
//     }
//   }

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
	let englishName, iso639_1, name: String

	enum CodingKeys: String, CodingKey {
		case englishName = "english_name"
		case iso639_1 = "iso_639_1"
		case name
	}
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseVideos { response in
//     if let videos = response.result.value {
//       ...
//     }
//   }

// MARK: - Videos
struct Videos: Codable {
	let results: [VideosResult]
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseResult { response in
//     if let result = response.result.value {
//       ...
//     }
//   }

// MARK: - Result
struct VideosResult: Codable {
	let iso639_1, iso3166_1, name, key: String
	let site: String
	let size: Int
	let type: String
	let official: Bool
	let publishedAt, id: String

	enum CodingKeys: String, CodingKey {
		case iso639_1 = "iso_639_1"
		case iso3166_1 = "iso_3166_1"
		case name, key, site, size, type, official
		case publishedAt = "published_at"
		case id
	}
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		decoder.dateDecodingStrategy = .iso8601
	}
	return decoder
}

func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		encoder.dateEncodingStrategy = .iso8601
	}
	return encoder
}


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}

	public var hashValue: Int {
		return 0
	}

	public func hash(into hasher: inout Hasher) {
		// No-op
	}

	public init() {}

	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}
