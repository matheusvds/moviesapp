//
//  ListMoviesDelegateDatasource.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/14/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import UIKit

class ListMoviesDatasource: NSObject {
    
    var listMovies: [Movie]
    var collectionView: UICollectionView
    
    init(listMovies: [Movie], collectionView: UICollectionView) {
        self.listMovies = listMovies
        self.collectionView = collectionView
        super.init()
        self.registerCell()
        self.setupCollectionView()
        
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func registerCell() {
        self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.movieCellIdentifier)
    }
    
    func setMovies(movies: [Movie]) {
        self.listMovies = movies
        reloadCollection()
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
}


extension ListMoviesDatasource: UICollectionViewDataSource {
    
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

extension ListMoviesDatasource: UICollectionViewDelegate {}


extension ListMoviesDatasource:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.bounds.height / 2.5
        let collectionPadding = CGFloat(45)
        let collectionWidth = collectionView.bounds.width - collectionPadding
        let cellWidth = collectionWidth / 2
        
        return CGSize(width: cellWidth, height: cellHeight);
    }
}
