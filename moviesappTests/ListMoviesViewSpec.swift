//
//  ListMoviesViewSpec.swift
//  moviesappTests
//
//  Created by Marco Marques on 08/05/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble

import Nimble_Snapshots
import UIKit

@testable import moviesapp

class ListMoviesViewSpec: QuickSpec {
    
    func loadJson(fromFileName fileName: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let filePath = bundle.path(forResource: fileName, ofType: "json")!
        return try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .uncached)
    }
    
    override func spec() {
    
        describe("ListMoviesViewController") {
            
            context("verify view ") {
                var session: URLSessionMock!
                var endpoint: TheMovieDBAPI!
                var movieClientMock: MovieClientMock!
                var sut: ListMoviesViewController!
                
                beforeEach {
                    endpoint = .popular
                    
                    session = URLSessionMock()
                    session.data = self.loadJson(fromFileName: "popularMovies")
                    session.error = nil
                    session.response = HTTPURLResponse(url: endpoint.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
                    
                    movieClientMock = MovieClientMock(session: session)
                    sut = ListMoviesViewController(client: movieClientMock)
                }
                
                it("") {
                    sut.viewDidLoad()
                }
            }
        }
        
    }
}
