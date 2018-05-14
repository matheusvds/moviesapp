//
//  ListMoviesViewController.swift
//  moviesapp
//
//  Created by Marco Marques on 04/05/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    // MARK: Properties
    let movieClient: MovieClient = MovieClient()
    var listMovies: [Movie] = []
    
    var myCollectionView: UICollectionView?
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.requestMovies()
    }

    fileprivate func createCollectionViewMovie() {
        self.title = "Movies"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.2, height: 200)
        
        self.myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        myCollectionView?.register(MovieCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.movieCellIdentifier)
        myCollectionView?.backgroundColor = .white
        
        self.view.addSubview(myCollectionView!)
    }
    
    fileprivate func createSearchBar() {
        
//        let height: CGFloat = 300 //whatever height you want to add to the existing height
//        let bounds = self.navigationController!.navigationBar.bounds
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true

        let leftNavBarButton = UIBarButtonItem(customView: searchController.searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
    
    fileprivate func requestMovies() {
        movieClient.getFeed(from: .popular) { results in
            switch results {
            case .success(let result):
                guard let popularMovies = result?.results else { return }
                self.listMovies = popularMovies
                self.myCollectionView?.reloadData()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    fileprivate func searchMovie(movieSearch: String) {
        movieClient.searchMovie(whith: .search(nameMovie: movieSearch)) { results in
            switch results {
            case .success(let result):
                guard let popularMovies = result?.results else { return }
                self.listMovies = popularMovies
                self.myCollectionView?.reloadData()
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}


extension ListMoviesViewController: BaseViewProtocol {
    func buildViewHierarchy() {
        self.requestMovies()
        self.createCollectionViewMovie()
        self.createSearchBar()
    }
    
    func setupConstraints() {
      
    }
}

extension ListMoviesViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text != ""{
            
            self.searchMovie(movieSearch: searchController.searchBar.text!)
        }
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        self.requestMovies()
    }
}

extension ListMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.listMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.movieCellIdentifier, for: indexPath) as! MovieCell
        myCell.fill(movie: self.listMovies[indexPath.row])
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
    
}
