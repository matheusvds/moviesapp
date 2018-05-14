//
//  ListMoviesDatasourceSpec.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/14/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import moviesapp

class ListMoviesDatasourceSpec: QuickSpec {
    override func spec() {
        describe("ListMoviesDatasource") {
            
            context("when created") {
                
                var sut: ListMoviesDatasource!
                
                beforeEach {
                    let fakeCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    let movies = [Movie(id: 0, title: "Ïronamn", poster_path: "/path", release_date: "2000", genre_ids: [], overview: "overview")]
                    sut = ListMoviesDatasource(listMovies: movies, collectionView: fakeCollection)
                }
                
                it("collectionview should not be nil"){
                    expect(sut.collectionView).toNot(beNil())
                }
                
                it("collectionview should be of type ListMoviesDatasource") {
                    expect(sut).to(beAKindOf(ListMoviesDatasource.self))
                }
                
                it("should have number of sections equals to 1") {
                    expect(sut.collectionView.numberOfSections).to(be(1))
                }
                
                it("should have number of rows equals to movies size") {
                    expect(sut.collectionView.numberOfItems(inSection: 0)).to(be(1))
                }
            }
        }
    }
}

