//
//  MovieDetailViewSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/15/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
import SDWebImage

@testable import moviesapp

class MovieDetailViewSpec: QuickSpec {
    override func spec() {
        describe("MovieDetailView") {
            
            var sut: MovieDetailView!
            var movie: Movie!
            beforeEach {
                movie = Movie(id: 0, title: "Ironamn", poster_path: "path", release_date: "2000", genre_ids: [], overview: "great movie")
                sut = MovieDetailView(frame: UIScreen.main.bounds, movie: movie)
            }
            
            it("should have the expected look and feel") {
                expect(sut) == snapshot("MovieDetailView")
            }
            
            context("when initialized") {
                
                it("should have set the movie") {
                    expect(sut.movie).toNot(beNil())
                }
            }
        }
    }
}
