//
//  EndpointSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/8/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import moviesapp

class EndpointSpec: QuickSpec {
    override func spec() {
        describe("TheMovieDBAPI Endpoint") {
            
            context("when endpoint is choosen"){
               var endpoint: TheMovieDBAPI!
                
                beforeEach {
                    endpoint = .popular
                }
                
                it("should return the correct endpoint for popular movies") {
                    expect(endpoint.path).to(equal("/3/movie/popular"))
                }
                
                it("should return the correct endpoint for genres") {
                    endpoint = .genres
                    expect(endpoint.path).to(equal("/3/genre/movie/list"))
                }
                
                it("should use the correct api key") {
                    expect(endpoint.apiKey).to(equal("api_key=780517cdd65386623d21c096f42be2ba"))
                }
                
            }
        }
    }
}
