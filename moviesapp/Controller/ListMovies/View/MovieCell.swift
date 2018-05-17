//
//  MovieCell.swift
//  moviesapp
//
//  Created by Marco Marques on 04/05/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    
    lazy var thumbMovie: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .green
        view.image = #imageLiteral(resourceName: "empty_movie")
        return view
    }()
    
    lazy var titleMovie: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .orange
        view.text = "Filme"
        view.backgroundColor = UIColor(red: 45/255.0, green: 48/255.0, blue: 71/255.0, alpha: 1)
        view.textColor = UIColor(red: 247/255.0, green: 206/255.0, blue: 91/255.0, alpha: 1)
        view.textAlignment = .center
        return view
    }()
    
    lazy var loading: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.backgroundColor = UIColor(red: 247/255.0, green: 206/255.0, blue: 91/255.0, alpha: 1)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(movie: Movie) {
        self.titleMovie.text = movie.title
        if let urlMovie = movie.poster_path {
            self.loading.startAnimating()
            self.thumbMovie.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w300\(urlMovie)")) { (image, error, cache, url) in
                if error == nil {
                    self.loading.stopAnimating()
                }
            }
        }
    }
}

extension MovieCell: BaseViewProtocol {
    func buildViewHierarchy() {
        addSubview(thumbMovie)
        addSubview(titleMovie)
        addSubview(loading)
    }
    
    func setupConstraints() {
        
        thumbMovie.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).inset(40.0)
        }
        
        titleMovie.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.top.equalTo(thumbMovie.snp.bottom).inset(0)
            make.left.bottom.right.equalToSuperview()
        }
        
        loading.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).inset(40.0)
        }
        
    }
    
}
