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
    
    override func loadView() {
        self.view = listMovieView
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
        self.listMovieView.searchDelegate = self
    }
}

extension ListMoviesViewController: ListMoviewSearchProtocol {
    func searchAllMovies() {
        self.requestMovies()
    }
    
    func searchMovies(nameMovie: String) {
        self.searchMovie(movieSearch: nameMovie)
    }
    
    
}
