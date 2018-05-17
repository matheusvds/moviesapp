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
    let listMovieView: ListMovieView = ListMovieView()
    var movieDatasource: ListMoviesDatasource?
    var searchController : UISearchController!

    
    override func loadView() {
        self.view = listMovieView
    }
    
    override func viewDidLoad() {
        self.setupDatasourceAndDelegates()
        createSearchBar()
        self.requestMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieDatasource?.reloadCollection()
    }

    
    fileprivate func createSearchBar() {
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
                self.movieDatasource?.setMovies(movies: popularMovies)
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    fileprivate func searchMovie(movieSearch: String) {
        movieClient.getFeed(from: .search(nameMovie: movieSearch)) { results in
            switch results {
            case .success(let result):
                guard let popularMovies = result?.results else { return }
                self.movieDatasource?.setMovies(movies: popularMovies)
            case .failure(let error):
                print("\(error)")
            }
        }
    }

    fileprivate func setupDatasourceAndDelegates() {
        self.movieDatasource = ListMoviesDatasource(listMovies: [], collectionView: listMovieView.collectionView)
        self.movieDatasource?.delegate = self
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

extension ListMoviesViewController: MoviesDatasourceDelegateProtocol {
    func didSelectCell(with movie: Movie) {
        let detailVC = MovieDetailController(with: movie)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
