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
    var movieClient: BaseClient
    let listMovieView: ListMovieView = ListMovieView()
    var movieDatasource: ListMoviesDatasource?
    
    override func loadView() {
        self.view = listMovieView
    }
    
    init(client: BaseClient = MovieClient()) {
        self.movieClient = client
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("You should't use storyboard in this app")
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
        self.listMovieView.searchDelegate = self
        self.movieDatasource?.delegate = self

    }
    
    
}

extension ListMoviesViewController: ListMoviewSearchProtocol {
    
    func searchMovies(nameMovie: String) {
            _ = Debouncer(delay: 0.3) {
            self.searchMovie(movieSearch: nameMovie)
        }.call()
    }
    
    func searchAllMovies() {
        self.requestMovies()
        self.listMovieView.searchDelegate = self
    }
}


extension ListMoviesViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text != ""{
                self.searchMovie(movieSearch: searchController.searchBar.text!)
        }
    }
}

extension ListMoviesViewController: MoviesDatasourceDelegateProtocol {
    func didSelectCell(with movie: Movie) {
        let detailVC = MovieDetailController(with: movie)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
