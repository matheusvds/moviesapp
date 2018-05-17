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
    
    var session = URLSession()
    
    func getFeed(from movieFeedType: TheMovieDBAPI, completion: @escaping (Result<MovieFeedResult?, APIError>) -> Void) {
        let data = self.loadJson(fromFileName: "searchMatrix")
        
        do {
            let resultMovies = try JSONDecoder().decode(MovieFeedResult.self, from: data)
            completion(.success(resultMovies))
        } catch {
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
