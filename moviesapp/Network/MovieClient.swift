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
    
    func get<T:Decodable>(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<T?, APIError>) -> Void) {
        
        let endpoint = movieFeedType
        let request = endpoint.request
        
        fetch(with: request, decode: { json -> T? in
            guard let movieFeedResult = json as? T else { return  nil }
            return movieFeedResult
        }, completion: completion)
    }
}
