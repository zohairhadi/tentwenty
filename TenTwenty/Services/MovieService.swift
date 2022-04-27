//
//  MovieService.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import Foundation
import Alamofire

class MovieService {
	private static let apiKey = "27ceb349f70220c55452aed69d31043f"
	private static let url = "https://api.themoviedb.org/3/movie/upcoming"
	private static let generUrl = "https://api.themoviedb.org/3/genre/movie/list"
	private static let endpoint = "upcoming"
	private static let params: Parameters = [
		"api_key":"27ceb349f70220c55452aed69d31043f"
		]

	// MARK: - endpoint functions
	static func fetchUpcomingMovies(completion: @escaping (_ movieData: UpcomingMovies?) -> Void){
		AF.request(url, method: .get, parameters: params)
		  .responseDecodable(of: UpcomingMovies.self) { response in
			  guard let starships = response.value else { return }
			  completion(starships)
		}
		completion(nil)
	}
	
	static func fetchMovie(movieId:Int, completion: @escaping (_ genres: Movie?) -> Void){
		let urlTo = "https://api.themoviedb.org/3/movie/\(movieId)"
		print(urlTo)
		let newParams: Parameters = [
			"api_key":"27ceb349f70220c55452aed69d31043f",
			"append_to_response":"videos"
		]
		
		AF.request(urlTo, method: .get, parameters: newParams)
		  .responseDecodable(of: Movie.self) { response in
			  guard let starships = response.value else { return }
			  completion(starships)
		}
		completion(nil)
	}
	
	static func fetchGenres(completion: @escaping (_ genres: Genre?) -> Void){
		AF.request(generUrl, method: .get, parameters: params)
		  .responseDecodable(of: Genre.self) { response in
			  guard let starships = response.value else { return }
			  completion(starships)
		}
		completion(nil)
	}
	
}
