//
//  MovieClient.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/7/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

protocol BaseClient: APIClient {
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void)
    func searchMovie(whith movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void)
}

class MovieClient: BaseClient {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    convenience init() {
        self.init(session: .shared)
    }
    
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        
        let endpoint = movieFeedType
        let request = endpoint.request
        
        fetch(with: request, decode: { json -> MovieFeedResult? in
            guard let movieFeedResult = json as? MovieFeedResult else { return  nil }
            return movieFeedResult
        }, completion: completion)
    }
    
    func searchMovie(whith movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        
        let endpoint = movieFeedType
        let search = endpoint.search
        
        fetch(with: search, decode: { json -> MovieFeedResult? in
            guard let movieFeedResult = json as? MovieFeedResult else { return  nil }
            return movieFeedResult
        }, completion: completion)
    }
    
    
    
}
