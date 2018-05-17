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
    
    func decode(json: Decodable) -> MovieFeedResult? {
        guard let movieFeedResult = json as? MovieFeedResult else { return  nil }
        return movieFeedResult
    }
    
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
       
        if let value = self.decode(json: self.loadJson(fromFileName: "popularMovies")) {
            completion(.success(value))
        } else {
            completion(.failure(.jsonParsingFailure))
        }
       
    }
    
    func searchMovie(whith movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        
    }
    
    
    func loadJson(fromFileName fileName: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let filePath = bundle.path(forResource: fileName, ofType: "json")!
        return try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .uncached)
    }
    
}
