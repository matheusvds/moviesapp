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
            it("should have the expected look and feel") {
                let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
                let sut = MovieAttributeView(frame: frame, name: "Thor")
                expect(sut) == recordSnapshot("MovieAttributeView")
            }
        }
    }
}
