//
//  MovieDetailViewController.swift
//  TenTwenty
//
//  Created by Zohair on 26/04/2022.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {

	// MARK: - variables
	var viewModel: MovieDetailsViewModel?
	
	@IBOutlet weak var genreCollectionView: UICollectionView!
	@IBOutlet weak var releaseDateLabel: UILabel!
	@IBOutlet weak var getTicketsButton: UIButton!
	@IBOutlet weak var overviewTextField: UITextView!
	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var watchTrailerButton: UIButton!
	
	var colorsList: [UIColor] = [UIColor(named: "Category-1") ?? .red, UIColor(named: "Category-2") ?? .red, UIColor(named: "Category-3") ?? .red, UIColor(named: "Category-4") ?? .red]
	
	// MARK: - init
//	init(paramViewModel: MovieDetailsViewModel?){
//		super.init(nibName: nil, bundle: nil)
//		self.viewModel = paramViewModel
//	}
//
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        initalizeView()
		initalizeCollectionView()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.prefersLargeTitles = false
		
		let appearance = UINavigationBarAppearance()
		appearance.configureWithTransparentBackground()
		navigationController?.navigationBar.standardAppearance = appearance
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		let appearance = UINavigationBarAppearance()
		navigationController?.navigationBar.standardAppearance = appearance
	}
	
	// MARK: - IBoutlets
	@IBAction func didTapWatchTrailer(_ sender: Any) {
		print("bout to play trailer")
		if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoPlayerViewController") as? VideoPlayerViewController {
			
			viewController.viewModel = YoutubePlayerViewModel(id: viewModel?.movieId.value)
			
			if let navigator = navigationController {
				navigator.pushViewController(viewController, animated: false)
			}
		}
	}
	
	@IBAction func didTapGetTickets(_ sender: Any) {
		if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookTicketViewController") as? BookTicketViewController {
			
			if let navigator = navigationController {
				navigator.pushViewController(viewController, animated: true)
			}
		}
	}
	
	// MARK: - helpers
	func initalizeView(){
		//bind views
		viewModel?.movieOverview.bind(listener: { overview in
			self.overviewTextField.text = overview
		})
		viewModel?.movieImageURL.bind(listener: { url in
			self.movieImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage())
		})
		viewModel?.releaseDate.bind(listener: { rDate in
			self.releaseDateLabel.text = "In theaters " + rDate
		})
		viewModel?.genreNames.bind(listener: { [weak self] _ in
			DispatchQueue.main.async {
				self?.genreCollectionView.reloadData()
			}
		})
		
		//init buttons
		watchTrailerButton.layer.borderWidth = 1
		watchTrailerButton.layer.borderColor = UIColor(named: "Secondary")?.cgColor ?? UIColor.systemBlue.cgColor
		watchTrailerButton.layer.cornerRadius = 10
		
		getTicketsButton.layer.borderColor = UIColor(named: "Secondary")?.cgColor ?? UIColor.systemBlue.cgColor
		getTicketsButton.layer.cornerRadius = 10
		
		//init imageview
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = CGRect(x: 0, y: 13, width: self.view.frame.width, height: self.movieImageView.bounds.maxY)
		gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.5).cgColor]
		self.movieImageView.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	func initalizeCollectionView(){
		genreCollectionView.delegate  = self
		genreCollectionView.dataSource  = self
		
		genreCollectionView.register(UINib(nibName: "GenreLabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreLabelCollectionViewCell")
		
		// set layout
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 100, height: 40)
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0
		genreCollectionView.collectionViewLayout = layout
	}
}

// MARK: - UICollectionView Extension
extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let viewModel = self.viewModel else {fatalError()}
		return viewModel.genreNames.value.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreLabelCollectionViewCell", for: indexPath) as? GenreLabelCollectionViewCell else {fatalError()}
		cell.genreTitle.text = viewModel?.genreNames.value[indexPath.row]
		cell.genreTitle.backgroundColor = colorsList[indexPath.row % 4]
		return cell
	}
}
