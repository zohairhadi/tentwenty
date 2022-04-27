//
//  VideoPlayerViewController.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import UIKit
import YoutubePlayer_in_WKWebView
import youtube_ios_player_helper

class VideoPlayerViewController: UIViewController {

	// MARK: - variablesr
	var viewModel: YoutubePlayerViewModel?
	
	@IBOutlet weak var youtubePlayer: YTPlayerView!
//	@IBOutlet weak var youtubePlayer: WKYTPlayerView!
	
	// MARK: - init
	override func viewDidLoad() {
        super.viewDidLoad()

        initalizeVideoPlayer()
    }

	// MARK: - helper
	func initalizeVideoPlayer(){
		//delegeate
		youtubePlayer.delegate =  self
		
		viewModel?.videoId.bind(listener: { [weak self] youtubeId in
			guard let youtubeId = youtubeId else {return}
			DispatchQueue.main.async {
				self?.youtubePlayer.load(withVideoId: youtubeId)
			}
		})
	}
}

// MARK: - Youtube Extension
extension VideoPlayerViewController: YTPlayerViewDelegate {
	func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
		switch state {
		case .cued:
			self.youtubePlayer.playVideo()
			break
		case .ended:
			self.navigationController?.popViewController(animated: false)
			break
		default:
			break
		}
	}
}
