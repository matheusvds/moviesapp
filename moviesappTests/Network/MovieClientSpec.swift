//
//  MovieClientSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/16/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import moviesapp

class MovieClientSpec: QuickSpec {
    override func spec() {
        describe("the MovieClient") {
            var session: URLSessionMock!
            var sut: MovieClient!
            
            beforeEach {
                session = URLSessionMock()
                
                session.data = self.loadJson(fromFileName: "popularMovies")
                session.error = nil
                session.response = HTTPURLResponse(url: URL(string: "http")!, statusCode: 200, httpVersion: nil, headerFields: nil)
                sut = MovieClient(session: session)
            }
            
            context("when initialized") {
                
                it("should have set a non nil session") {
                    expect(sut.session).toNot(beNil())
                }
            }
            
            context("when requested to get popular movies results") {
                var movies: Any!
                
                beforeEach {
                    sut.getFeed(from: TheMovieDBAPI.popular, completion: { (request) in
                        switch request {
                        case .success(let successResult):
                            guard let movieResults = successResult?.results else { return }
                            movies = movieResults
                        case .failure:
                            break
                        }
                    })
                }
                
                it("should return non nil results") {
                    expect(movies).toEventuallyNot(beNil())
                }
                
                it("should return results on movies correct type") {
                    expect(movies).toEventually(beAKindOf([Movie].self))
                }
            }
            
            context("when requested to get search results") {
                var movies: Any!
                
                
                beforeEach {
                    sut.getFeed(from: TheMovieDBAPI.search(nameMovie: "Nome"), completion: { (request) in
                        switch request {
                        case .success(let successResult):
                            guard let movieResults = successResult?.results else { return }
                            movies = movieResults
                        case .failure:
                            break
                        }
                    })
                }
                
                it("should return non nil results") {
                    expect(movies).toEventuallyNot(beNil())
                }
                
                it("should return results on movies type") {
                    expect(movies).toEventually(beAKindOf([Movie].self))
                }
            }
            
            context("when requested to get genres") {
                var genres: Any!
                
                beforeEach {
                    
                    session.data = self.loadJson(fromFileName: "genres")
                    
                    sut.getGenres(from: TheMovieDBAPI.genres, completion: { (request) in
                        switch request {
                        case .success(let successResult):
                            guard let genreResults = successResult?.genres else { return }
                            genres = genreResults
                        case .failure:
                            break
                        }
                    })
                }
                
                it("should return non nil results") {
                    expect(genres).toEventuallyNot(beNil())
                }
                
                it("should return results on genres type") {
                    expect(genres).toEventually(beAKindOf([Genre].self))
                }
            }
        }
    }
    
    func loadJson(fromFileName fileName: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let filePath = bundle.path(forResource: fileName, ofType: "json")!
        return try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .uncached)
    }
}
