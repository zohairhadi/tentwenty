//
//  WatchViewController.swift
//  TenTwenty
//
//  Created by Zohair on 25/04/2022.
//

import UIKit
import SDWebImage

class WatchViewController: UIViewController {

	// MARK: - variables
	private let viewModel = WatchViewModel()
	@IBOutlet weak var movieTableView: UITableView!
	
	// MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		bindViewModel()
		initalizeNavgationBar()
		initalizeView()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.prefersLargeTitles = false
	}
    
	// MARK: - helper
	func bindViewModel(){
		viewModel.movieTitle.bind { [weak self] _ in
			DispatchQueue.main.async {
				self?.movieTableView.reloadData()
			}
		}
		
		//only need to do once because they will be updated side by side
	}
	
	func initalizeNavgationBar(){
		// right bar button item
		let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")!,
										   style: .plain,
										   target: self,
										   action: #selector(didTapSearchButton))
		// left bar button item
		let label = UILabel()
		label.textColor = UIColor.black
		label.font = label.font.withSize(20)
		label.text = "Watch"

		// add items to the navbar
		navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
		navigationItem.rightBarButtonItem = searchButton
		navigationItem.rightBarButtonItem?.tintColor = .black
	}
	
	func initalizeView(){
		movieTableView.delegate = self
		movieTableView.dataSource = self
		
		//register cells
		movieTableView.register(UINib(nibName: "WatchMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "WatchMovieTableViewCell")
	}
	
	@objc func didTapSearchButton() {
		if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieCategoryViewController") as? MovieGenreViewController {
			
			if let navigator = navigationController {
				navigator.pushViewController(viewController, animated: false)
			}
		}
	}
}

// MARK: - UITableView Extension
extension WatchViewController: UITableViewDelegate,UITableViewDataSource  {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.movieTitle.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "WatchMovieTableViewCell", for: indexPath) as? WatchMovieTableViewCell else {fatalError("Unexpected Table View Cell")}
		
		cell.movieImageTitle.text =  viewModel.movieTitle.value[indexPath.row]
		cell.movieImageView.sd_setImage(with: URL(string: viewModel.movieImageURL.value[indexPath.row]), placeholderImage: UIImage())
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let tappedCell = viewModel.movieData.value?.results[indexPath.row]
		guard let tappedMovie = tappedCell else  {return}
		
		if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
			
			viewController.viewModel = MovieDetailsViewModel(url: tappedMovie.posterPath, overview: tappedMovie.overview, date: tappedMovie.releaseDate, movId: tappedMovie.id, genreList: tappedMovie.genreIDS)
			
			if let navigator = navigationController {
				navigator.pushViewController(viewController, animated: true)
			}
		}
	}
}
