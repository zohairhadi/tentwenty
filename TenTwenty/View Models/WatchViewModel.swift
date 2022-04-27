//
//  WatchViewModel.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import Foundation
import UIKit.UIImage

public class WatchViewModel {
	// MARK: - variables
	let movieTitle: Box<[String]> = Box([])
	let movieImageURL: Box<[String]> = Box([])
	let movieData: Box<UpcomingMovies?> = Box(nil)
	
	let downloadMediaPath = "https://image.tmdb.org/t/p/original"
	
	// MARK: - init
	init(){
		
		// fetch latest data
		fetchMovieData()
	}
	
	// MARK: - helpers
	func fetchMovieData(){
		MovieService.fetchUpcomingMovies() { [weak self] movieData in
			self?.movieData.value = movieData
			guard let movies = movieData?.results else {return}
			for movie in movies {
				let movieBackdropPath = self!.downloadMediaPath + movie.backdropPath
				let movieTitle = movie.title
				
				self!.movieImageURL.value.append(movieBackdropPath)
				self!.movieTitle.value.append(movieTitle)
			}
		}
	}
}
