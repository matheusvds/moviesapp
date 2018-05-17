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


class ListMoviesDatasourceMock: ListMoviesDatasource {
    var reloaded: Bool = false
    
    override func reloadCollection() {
        super.reloadCollection()
        reloaded = true
    }
    
}

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
                
                it("should have the delegate setup") {
                    expect(sut.collectionView.delegate).toNot(beNil())
                    expect(sut.collectionView.dataSource).to(beAKindOf(ListMoviesDatasource.self))
                }
                
                it("should have the datasource setup") {
                    expect(sut.collectionView.dataSource).toNot(beNil())
                    expect(sut.collectionView.dataSource).to(beAKindOf(ListMoviesDatasource.self))
                }
            }
            
            context("when setting movies") {

                var sut: ListMoviesDatasourceMock!
                var movies: [Movie]!

                beforeEach {
                    let fakeCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                    movies = [Movie(id: 0, title: "Ïronamn", poster_path: "/path", release_date: "2000", genre_ids: [], overview: "overview")]
                    sut = ListMoviesDatasourceMock(listMovies: [], collectionView: fakeCollection)
                    sut.setMovies(movies: movies)
                }

                it("should set listmovies in ListMoviesDataSource") {
                    expect(sut.listMovies.first!.title).to(equal(movies.first!.title))
                }
                
                it("should call the reload method") {
                    expect(sut.reloaded).to(beTrue())
                }

            }
            
            context("when searching") {
                
                
                it("should filter movie by its title") {
                    
                }
                
                it("should return movie from filtered array") {
                    
                }
                
                it("should return number of filtered movies") {
                    
                }
            }
        }
    }
}

