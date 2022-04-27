//
//  MovieCategoryCollectionViewCell.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import UIKit

class MovieCategoryCollectionViewCell: UICollectionViewCell {

	// MARK: - variables
	@IBOutlet weak var categoryImageView: UIImageView!
	@IBOutlet weak var categoryTitleLabel: UILabel!
	
	// MARK: - init
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		categoryImageView.layer.cornerRadius = 8.0
		categoryImageView.clipsToBounds = true

    }

}
