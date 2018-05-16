//
//  MovieClientMock.swift
//  moviesappTests
//
//  Created by Marco Marques on 16/05/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation


@testable import moviesapp


class MovieClientMock: BaseClient {
    
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        
    }
    
    func searchMovie(whith movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        
    }
    
}
