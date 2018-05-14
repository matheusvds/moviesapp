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
    var listMovies: [Movie]?
    
    var myCollectionView: UICollectionView?
    var listMoviesViewScreen: ListMoviesViewScreen = ListMoviesViewScreen()

    
    override func loadView() {
        super.loadView()
        self.view = ListMoviesViewScreen()
        self.myCollectionView = listMoviesViewScreen.collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createCollectionViewMovie()
        self.requestMovies()
    }
}


extension ListMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let coutMovies = self.listMovies?.count {
           return coutMovies
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.movieCellIdentifier, for: indexPath) as! MovieCell
        if let moviesList = self.listMovies {
            fill(myCell, with: moviesList[indexPath.row])
        }
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
}

//MARK: Helper methods

extension ListMoviesViewController {
    
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
    
    fileprivate func fill(_ cell: MovieCell, with movie: Movie) {
        cell.titleMovie.text = movie.title
        if let urlMovie = movie.poster_path {
            cell.loading.startAnimating()
            cell.thumbMovie.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w300\(urlMovie)")) { (image, error, cache, url) in
                if error == nil {
                    cell.loading.stopAnimating()
                }
            }
        }
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
    
    
}


