//
//  MovieGenreViewModel.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import Foundation


//


import UIKit.UIImage

public class MovieGenreViewModel {
	// MARK: - variables
	let genreTitle: Box<[String]> = Box([])
	let genreImageURL: Box<[String]> = Box([])
	let genreData: Box<Genre?> = Box(nil)
	
	let downloadMediaPath = "https://image.tmdb.org/t/p/original"
	
	// MARK: - init
	init(){
		
		// fetch latest data
		fetchGenreData()
	}
	
	// MARK: - helpers
	func fetchGenreData(){
		MovieService.fetchGenres { [weak self] movieGenres in
			self?.genreData.value = movieGenres
			guard let genres = movieGenres?.genres else {return}
			
			for genre in genres {
				let genreBackdropPath = self!.downloadMediaPath
				let genreTitle = genre.name
				
				self!.genreImageURL.value.append(genreBackdropPath)
				self!.genreTitle.value.append(genreTitle)
			}
		}
	}
}
