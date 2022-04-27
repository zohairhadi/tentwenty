//
//  GenreLabelCollectionViewCell.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import UIKit

class GenreLabelCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var genreTitle: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		genreTitle.textColor = .white
		genreTitle.layer.backgroundColor  = UIColor.red.cgColor
		genreTitle.layer.cornerRadius = 15
		genreTitle.layer.masksToBounds = true
    }

}
