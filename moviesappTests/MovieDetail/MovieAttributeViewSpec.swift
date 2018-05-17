//
//  MovieAttributeView.swift
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

class MovieAttributeViewSpec: QuickSpec {
    override func spec() {
        describe("'MovieAttributeView'") {
            
            var sut: MovieAttributeView!
            var movie: Movie!
            beforeEach {
                let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
                movie = Movie(id: 0, title: "Ironamn", poster_path: "path", release_date: "2000", genre_ids: [], overview: "great movie")
                sut = MovieAttributeView(frame: frame, name: movie.title!)
            }
            
            it("should have the expected look and feel") {
                expect(sut) == snapshot("MovieAttributeView")
            }
            
            context("when initialized") {
                
                it("should have set the correct movie name") {
                    expect(sut.name).to(equal(movie.title!))
                }
            }
        }
    }
}
