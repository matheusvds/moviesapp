//
//  MovieCellSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/10/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

import Foundation
import Quick
import Nimble

@testable import moviesapp

class MovieCellSpec: QuickSpec {
    override func spec() {
        describe(" MovieCell ") {
            it("has the expected look and feel") {
                let frame = CGRect(x: 0, y: 0, width: 100, height: 300)
                let movieCell = MovieCell(frame: frame)
            }
        }
    }
}

