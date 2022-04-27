//
//  MovieCategoryViewController.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import UIKit
class MovieGenreViewController: UIViewController {

	// MARK: - variables
	@IBOutlet weak var categoryCollectionView: UICollectionView!
	let viewModel = MovieGenreViewModel()
	let searchController = UISearchController(searchResultsController: SearchTableViewController())
	
	// MARK: - init
	override func viewDidLoad() {
        super.viewDidLoad()

		bindViewModel()
		initalizeNavBar()
        initalizeCollectionView()
    }
    
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.prefersLargeTitles = false
	}

	// MARK: - helpers
	func bindViewModel(){
		viewModel.genreTitle.bind { [weak self] _ in
			DispatchQueue.main.async {
				self?.categoryCollectionView.reloadData()
			}
		}
	}
	
	func initalizeNavBar(){
		searchController.searchBar.delegate =  self
		
		searchController.searchResultsUpdater = self
		navigationItem.searchController = searchController
	}
	
	
	func initalizeCollectionView(){
		categoryCollectionView.delegate = self
		categoryCollectionView.dataSource = self
		
		categoryCollectionView.register(UINib(nibName: "MovieCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryCollectionViewCell")
		
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 15, left: 21, bottom: 0, right: 21)
		layout.scrollDirection = .vertical
		layout.itemSize = CGSize(width: 190, height: 120)
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 0
		categoryCollectionView.collectionViewLayout = layout
	}
}

// MARK: - UICollectionView Extension
extension MovieGenreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.genreTitle.value.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCategoryCollectionViewCell", for: indexPath) as? MovieCategoryCollectionViewCell else  {fatalError()}
		
		cell.categoryImageView.image = UIImage(named: "na") //need to use genre images here [not avaliable in api]
		cell.categoryTitleLabel.text = viewModel.genreTitle.value[indexPath.row]
		return cell
	}
}

// MARK: - UISearchBar Extension
extension MovieGenreViewController: UISearchBarDelegate, UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		guard let searchedText = searchController.searchBar.text else {return}
		
		print(searchedText)
	}
	
	
}
