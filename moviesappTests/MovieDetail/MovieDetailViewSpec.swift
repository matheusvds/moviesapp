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

@testable import moviesapp

class MovieDetailViewSpec: QuickSpec {
    override func spec() {
        describe("MovieDetailView") {
            it("should have the expected look and feel") {
                let movie = Movie(id: 0, title: "Thor", poster_path: "/path.jpg", release_date: "2000", genre_ids: [], overview: "good movie")
                let sut = MovieDetailView(frame: UIScreen.main.bounds, movie: movie)
                expect(sut) == recordSnapshot("MovieDetailView")
            }
        }
    }
}
