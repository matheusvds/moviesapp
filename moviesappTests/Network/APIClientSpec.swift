//
//  APIClientSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/8/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//
import Foundation
import Quick
import Nimble

@testable import moviesapp

class APIClientSpec: QuickSpec {
    
    override func spec() {
       
        describe("the 'APIClient'") {
            
            var session: URLSessionMock!
            var endpoint: TheMovieDBAPI!
            var sut: MovieClient!
            
            context("when requested the api to fetch task") {
                beforeEach {
                    endpoint = .popular
                    
                    session = URLSessionMock()
                    
                    session.data = self.loadJson(fromFileName: "popularMovies")
                    session.error = nil
                    session.response = HTTPURLResponse(url: endpoint.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
                    
                    sut = MovieClient(session: session)
                    
                }
                
                it("should return invalid data error when data has invalid format") {
                    var sessionError: APIError!
                    
                    sut.fetch(with: endpoint.request, decode: { (json) -> MovieFeedResult? in
                        return nil
                    }, completion: { (result) in
                        switch result {
                        case .failure(let error):
                            sessionError = error
                        case .success:
                            sessionError = nil
                        }
                    })
                    expect(sessionError).toEventually(equal(APIError.jsonParsingFailure))
                }
            }
            
            context("when requested the api to fetch Movie") {
                
                beforeEach { 
                    endpoint = .popular
                    
                    session = URLSessionMock()
                    
                    session.data = self.loadJson(fromFileName: "popularMovies")
                    session.error = nil
                    session.response = HTTPURLResponse(url: endpoint.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
                    
                    sut = MovieClient(session: session)
                    
                }
                
                it("should return invalid data error when data has invalid format") {
                    var sessionError: APIError!
                    
                    sut.fetch(with: endpoint.request, decode: { (json) -> MovieFeedResult? in
                        return nil
                    }, completion: { (result) in
                        switch result {
                        case .failure(let error):
                            sessionError = error
                        case .success:
                            sessionError = nil
                        }
                    })
                    expect(sessionError).toEventually(equal(APIError.jsonParsingFailure))
                }    
            }
            
            
            context("when requested the api to decode task") {
                
                beforeEach {
                    endpoint = .popular
                    
                    session = URLSessionMock()
                    
                    session.data = self.loadJson(fromFileName: "popularMovies")
                    session.error = nil
                    session.response = HTTPURLResponse(url: endpoint.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
                    
                    sut = MovieClient(session: session)

                }
                
                it("should return a decodable result when receive the expected parameters") {
                    var result: Decodable!
                    
                    sut.decodingTask(with: endpoint.request, decodingType: MovieFeedResult.self, completionHandler: { (json, error) in
                        guard let movieFeed = json else { return }
                        result = movieFeed
                    }).resume()
                    
                    expect(result).toNotEventually(beNil())
                }
                
                it("should return invalid data error when data has invalid format") {
                    var sessionError: APIError!
                    
                    sut.decodingTask(with: endpoint.request, decodingType: Data.self, completionHandler: { (json, error) in
                        guard let error = error else { return }
                        sessionError = error
                    }).resume()
                    
                    expect(sessionError).toEventually(equal(APIError.jsonConversionFailure))
                }

                it("should return invalid data error when data is nil") {
                    session.data = nil
                    
                    var sessionError: APIError!
                    
                    sut.decodingTask(with: endpoint.request, decodingType: MovieFeedResult.self, completionHandler: { (json, error) in
                        guard let error = error else { return }
                        sessionError = error
                    }).resume()
                    
                    expect(sessionError).toEventually(equal(APIError.invalidData))
                }
                
                it("should return request failed error if response is null") {
                    session.response = nil
                    
                    var sessionError: APIError!
                    
                    sut.decodingTask(with: endpoint.request, decodingType: MovieFeedResult.self, completionHandler: { (json, error) in
                        guard let error = error else { return }
                        sessionError = error
                    }).resume()
                    
                    expect(sessionError).toEventually(equal(APIError.requestFailed))
                }
                
                it("should return unsuccessful error if response code different from 200") {
                    session.response = HTTPURLResponse(url: endpoint.request.url!, statusCode: 0, httpVersion: nil, headerFields: nil)
                    var sessionError: APIError!
                    
                    sut.decodingTask(with: endpoint.request, decodingType: MovieFeedResult.self, completionHandler: { (json, error) in
                        guard let error = error else { return }
                        sessionError = error
                    }).resume()
                    
                    expect(sessionError).toEventually(equal(APIError.responseUnsuccessful))
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

