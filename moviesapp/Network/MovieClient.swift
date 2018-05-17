//
//  MovieClient.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/7/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

class MovieClient: APIClient {
    
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
    
    func getGenres(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<GenreFeed?, APIError>) -> Void) {
        
        let endpoint = movieFeedType
        let request = endpoint.request
        
        fetch(with: request, decode: { json -> GenreFeed? in
            guard let movieFeedResult = json as? GenreFeed else { return  nil }
            return movieFeedResult
        }, completion: completion)
    }
}
