//
//  WatchMovieTableViewCell.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import UIKit

class WatchMovieTableViewCell: UITableViewCell {

	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var movieImageTitle: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		initalizeView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func initalizeView(){
		movieImageView.layer.cornerRadius = 8.0
		movieImageView.clipsToBounds = true
	}
    
}
