//
//  Movie.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/7/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

struct Movie : Codable {
    let id : Int?
    let title: String?
    let poster_path: String?
    let release_date: String?
    let genre_ids: [Int]?
    let overview: String?
}
