//
//  YoutubePlayerViewModel.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import Foundation

public class YoutubePlayerViewModel {
	// MARK: - variables
	let videoId: Box<String?> = Box(nil)
	var movieId = 0
	
	// MARK: - init
	init(id: Int?){
		guard let id = id else {return}
		self.movieId = id
		
		getVideoId()
	}
	
	// MARK: - helpers
	func getVideoId(){
		MovieService.fetchMovie(movieId: movieId) { movieData in
//			self.videoId.value = "1HqBaI-FV7Y"
			print(movieData)
			guard let movieData = movieData else {return}
			
			for video in movieData.videos.results {
				if (video.type  == "Trailer" || video.type == "Teaser"){
					self.videoId.value = video.key
					return
				}
			}
		}
	}
}
