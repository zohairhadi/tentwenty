//
//  SeatsCollectionViewCell.swift
//  TenTwenty
//
//  Created by Zohair on 28/04/2022.
//

import UIKit

class SeatsCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var bottomLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor(named: "Secondary")?.cgColor ?? UIColor.systemBlue.cgColor
		imageView.layer.cornerRadius = 10
		
    }

}
