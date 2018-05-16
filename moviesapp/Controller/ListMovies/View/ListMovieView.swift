//
//  ListMovieView.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/14/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class ListMovieView: UIView {
    
    // MARK: Properties
    weak var searchDelegate: ListMoviewSearchProtocol?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: self.flowLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.minimumLineSpacing = 15
        return flowLayout
    }()
    
    lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.placeholder = "Digite o nome do filme"
        searchBar.tintColor = UIColor(red: 247/255.0, green: 206/255.0, blue: 91/255.0, alpha: 1)
        searchBar.backgroundColor = UIColor(red: 247/255.0, green: 206/255.0, blue: 91/255.0, alpha: 1)
        searchBar.delegate = self
        return searchBar
    }()
    
    
    // MARK: Functions
    
}

extension ListMovieView: BaseViewProtocol {
    
    func buildViewHierarchy() {
        self.addSubview(self.searchBar)
        self.addSubview(self.collectionView)
    }
    
    func setupConstraints() {
        
        self.searchBar.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self.searchBar.snp.bottom)
            make.bottom.equalTo(self)
        }
    }
}

extension ListMovieView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            self.searchDelegate?.searchMovies(nameMovie: searchText)
        }
    }
}

