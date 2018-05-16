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
            context("UI ScreemShot") {
                it("should have the expected look and feel"){
                    let sut = ListMovieView(frame: UIScreen.main.bounds)
                    expect(sut) == snapshot("ListMovieView")
                }
            }
        }
        
        describe("UI SearchBarController") {
            context("when created") {
                
                var sut: ListMoviesViewController!
                
                beforeEach {
                    sut = ListMoviesViewController()
                    
                    
//                    let fakeSearchBarController = UISearchController()
//                    sut.searchController = fakeSearchBarController
//                    sut.searchController.delegate = ListMoviesViewController()
//                    sut.searchController.searchBar.placeholder = "Digite o nome do filme"
                }
//
//                it("searchBarcontroller test nil") {
//                    expect(sut.searchController.searchBar.text).to(beEmpty())
//                }
//
//                it("searchBarcontroller test placeholder is Empty") {
//                    expect(sut.searchController.searchBar.placeholder).toNot(beEmpty())
//                }
//
//                it("searchBarcontroller test placeholder") {
//                    expect(sut.searchController.searchBar.placeholder).to(equal("Digite o nome do filme"))
//                }
//
//                it("searchBarController should not be nil"){
//                    expect(sut.searchController).toNot(beNil())
//                }
//
//                it("searchBarController dimsBackgroundDuringPresentation should not true") {
//                    expect(sut.searchController.dimsBackgroundDuringPresentation).to(beFalse())
//                }
//
//                it("searchBarController hidesNavigationBarDuringPresentation should not true") {
//                    expect(sut.searchController.hidesNavigationBarDuringPresentation).to(beFalse())
//                }
//
//                it("ListMoviesViewController should be of type ListMoviesViewController") {
//                    expect(sut).to(beAKindOf(ListMoviesViewController.self))
//                }
                
            }
            
            
            
        }
    }
}
