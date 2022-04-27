//
//  DatesCollectionViewCell.swift
//  TenTwenty
//
//  Created by Zohair on 28/04/2022.
//

import UIKit

class DatesCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		titleLabel.layer.cornerRadius = 10
		titleLabel.layer.masksToBounds = true
		
//		self.titleLabel.layer.shadowOffset = CGSize(width: 10,
//										  height: 10)
//		self.titleLabel.layer.shadowRadius = 10
//		self.titleLabel.layer.shadowColor = UIColor(named: "Secondary")?.cgColor ?? UIColor.systemBlue.cgColor
//		self.titleLabel.layer.shadowOffset = CGSize(width: 30, height: 30)
//		self.titleLabel.layer.shadowOpacity = 0.3
		
		titleLabel.layer.shadowColor = UIColor.black.cgColor
		titleLabel.layer.shadowOpacity = 1
		titleLabel.layer.shadowOffset = .zero
		titleLabel.layer.shadowRadius = 10
		
    }

}
