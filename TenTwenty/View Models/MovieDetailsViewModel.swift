//
//  MovieDetailsViewModel.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import Foundation

public class MovieDetailsViewModel {
	// MARK: - variables
//	let movieTitle: Box<String> = Box("")
	let movieImageURL: Box<String> = Box("")
	let movieOverview: Box<String> = Box("")
	let releaseDate: Box<String> = Box("")
	var genreIds: [Int] = []
	let genreNames: Box<[String]> = Box([])
	let movieId: Box<Int> = Box(1)
	
	let downloadMediaPath = "https://image.tmdb.org/t/p/original"
	
	// MARK: - init
	init(url: String?, overview: String?, date: String?, movId: Int?, genreList: [Int]?){
		
		guard let date = date else {return}
		guard let url = url else {return}
		guard let overview = overview else {return}
		guard let genreList = genreList else {return}
		guard let movId = movId else {return}
		
		self.releaseDate.value = date
		self.movieImageURL.value = downloadMediaPath + url
		self.movieOverview.value = overview
		self.movieId.value = movId
		self.genreIds = genreList
		
		fetchGenreData()
	}
	
	// MARK: - helper
	func fetchGenreData(){
		MovieService.fetchGenres { [weak self] movieGenres in
			guard let movieGenreList = movieGenres?.genres else {return}
			
			// add genre names where ids match
			for id in self!.genreIds {
				for genre in movieGenreList {
					if (id == genre.id){
						self?.genreNames.value.append(genre.name)
					}
				}
			}
		}
	}
	
}
