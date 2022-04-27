//
//  SearchTableViewCell.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

	@IBOutlet weak var searchCategoryLabel: UILabel!
	@IBOutlet weak var searchTitleLabel: UILabel!
	@IBOutlet weak var searchImageVIew: UIImageView!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		searchImageVIew.layer.cornerRadius = 8.0
		searchImageVIew.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
