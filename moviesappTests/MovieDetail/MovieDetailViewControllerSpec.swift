//
//  MovieDetailViewControllerSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/16/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import moviesapp

class MovieDetailViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("the 'ViewController' ") {
            
            var sut: MovieDetailController!
            var movie: Movie!
            
            beforeEach {
                movie = Movie(id: 0, title: "Ironamn", poster_path: "path", release_date: "2000", genre_ids: [], overview: "great movie")
                sut = MovieDetailController(with: movie)
            }
            
            context("when MovieDetailController is initialized") {
                it("should have set a movie"){
                    expect(sut.movie).toNot(beNil())
                }
            }
            
            context("when view is loaded") {
                it("should have its view of kind MovieDetailView") {
                    expect(sut.view).to(beAKindOf(MovieDetailView.self))
                }
            }
        }
    }
}

