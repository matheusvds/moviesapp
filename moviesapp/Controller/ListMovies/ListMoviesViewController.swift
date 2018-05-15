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
        createSearchBar()
    }
    
    override func viewDidLoad() {
        self.setupDatasourceAndDelegates()
        self.requestMovies()
        self.title = "Movies"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieDatasource?.reloadCollection()
    }

    
    fileprivate func createSearchBar() {
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.placeholder = "Digite o nome do filme"
        self.navigationItem.searchController = searchController
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
        movieClient.searchMovie(whith: .search(nameMovie: movieSearch)) { results in
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

