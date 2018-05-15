//
//  MovieDetailView.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/15/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import UIKit

final class MovieDetailView: UIView {
    
    let movie: Movie
    
    lazy var movieImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var movieName: MovieAttributeView = {
        let view = MovieAttributeView(name: self.movie.title ?? "")
        return view
    }()
    
    lazy var releaseDate: MovieAttributeView = {
        let view = MovieAttributeView(name: self.movie.release_date ?? "")
        return view
    }()
    
    lazy var genres: MovieAttributeView = {
        let view = MovieAttributeView(name: "Action, Adventure")
        return view
    }()
    
    lazy var loading: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.backgroundColor = UIColor(red: 247/255.0, green: 206/255.0, blue: 91/255.0, alpha: 1)
        return view
    }()
    
    lazy var overview: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = self.movie.overview
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    init(frame: CGRect = .zero, movie: Movie) {
        self.movie = movie
        super.init(frame: frame)
        setupView()
        loadImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadImage() {
        if let urlMovie = self.movie.poster_path {
            self.loading.startAnimating()
            self.movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w300\(urlMovie)")) { (image, error, cache, url) in
                if error == nil {
                    self.loading.stopAnimating()
                }
            }
        }
    }
    
}

extension MovieDetailView: BaseViewProtocol {
    func buildViewHierarchy() {
        addSubview(movieImage)
        addSubview(movieName)
        addSubview(releaseDate)
        addSubview(genres)
        addSubview(overview)
        addSubview(loading)
    }
    
    func setupConstraints() {
        movieImage.snp.makeConstraints { (make) in
            make.top.equalTo(self).inset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).inset(10)
            make.height.equalTo(self).multipliedBy(0.5)
        }
        
        loading.snp.makeConstraints { (make) in
            make.top.equalTo(self).inset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).inset(10)
            make.height.equalTo(self).multipliedBy(0.5)
        }
        
        movieName.snp.makeConstraints { (make) in
            make.height.equalTo(self).multipliedBy(0.06)
            make.width.equalTo(movieImage.snp.width)
            make.top.equalTo(movieImage.snp.bottom)
            make.left.equalTo(movieImage.snp.left)
        }
        
        releaseDate.snp.makeConstraints { (make) in
            make.height.equalTo(movieName.snp.height)
            make.width.equalTo(movieName.snp.width)
            make.top.equalTo(movieName.snp.bottom)
            make.left.equalTo(movieImage.snp.left)
        }
        
        genres.snp.makeConstraints { (make) in
            make.height.equalTo(movieName.snp.height)
            make.width.equalTo(movieName.snp.width)
            make.top.equalTo(releaseDate.snp.bottom)
            make.left.equalTo(movieImage.snp.left)
        }
        
        overview.snp.makeConstraints { (make) in
            make.top.equalTo(genres.snp.bottom)
            make.left.equalTo(movieImage.snp.left)
            make.right.equalTo(movieImage.snp.right)
            make.bottom.equalTo(self)
        }
    }
    
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
    
}
