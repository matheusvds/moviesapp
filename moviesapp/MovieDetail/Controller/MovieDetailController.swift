//
//  MovieDetailController.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/15/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailController: UIViewController {
    
    let movieClient: MovieClient = MovieClient()
    let movie: Movie
    
    init(with movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = MovieDetailView(movie: movie, client: movieClient)
    }
    
}
