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
    
    override func spec() {
    
        describe("a 'ListMoviesView'"){
            context("UI") {
                it("should have the expected look and feel"){
                    let sut = ListMovieView(frame: UIScreen.main.bounds)
                    expect(sut) == snapshot("ListMovieView")
                }
            }
        }
    }
}
