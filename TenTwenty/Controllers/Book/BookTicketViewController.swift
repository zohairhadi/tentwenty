//
//  BookTicketViewController.swift
//  TenTwenty
//
//  Created by Zohair on 27/04/2022.
//

import UIKit

class BookTicketViewController: UIViewController {
	@IBOutlet weak var datesCollectionView: UICollectionView!
	@IBOutlet weak var seatsCollectionView: UICollectionView!
	@IBOutlet weak var selectButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
// MARK: - helper
	func initView(){
		selectButton.layer.cornerRadius = 10
		
		datesCollectionView.delegate = self
		datesCollectionView.dataSource = self
		datesCollectionView.register(UINib(nibName: "DatesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DatesCollectionViewCell")
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 80, height: 50)
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0
		datesCollectionView.collectionViewLayout = layout
		
		seatsCollectionView.delegate = self
		seatsCollectionView.dataSource = self
		seatsCollectionView.register(UINib(nibName: "SeatsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeatsCollectionViewCell")
		let layout2: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout2.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout2.scrollDirection = .horizontal
		layout2.itemSize = CGSize(width: 260, height: 220)
		layout2.minimumLineSpacing = 0
		layout2.minimumInteritemSpacing = 0
		seatsCollectionView.collectionViewLayout = layout2
	}
}

// MARK: - UIcollecioniew extension
extension BookTicketViewController: UICollectionViewDelegate,UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if (collectionView == datesCollectionView) {
			return 5
		}
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if (collectionView == datesCollectionView) {
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatesCollectionViewCell", for: indexPath) as? DatesCollectionViewCell else {fatalError()}
			cell.titleLabel.text = "5 Mar"
			return cell
		}
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatsCollectionViewCell", for: indexPath) as? SeatsCollectionViewCell else {fatalError()}
		return cell
	}
	
	
}
