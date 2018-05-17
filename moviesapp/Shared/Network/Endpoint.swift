//
//  Endpoint.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/7/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var query: String? { get }
}

extension Endpoint {
    
    var apiKey: String {
        return "780517cdd65386623d21c096f42be2ba"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        let searchQuery = URLQueryItem(name: "query", value: query)
        let apiQuery = URLQueryItem(name: "api_key", value: apiKey)
        components.queryItems = [apiQuery, searchQuery]
        components.queryItems = components.queryItems?.filter { $0.value != nil}
        return components
    }
    
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum TheMovieDBAPI {
    case popular
    case genres
    case search(nameMovie: String)
}

extension TheMovieDBAPI: Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var query: String? {
        switch self {
        case .search(let movieName):
            return "\(movieName)"
        default:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/3/movie/popular"
        case .genres:
            return "/3/genre/movie/list"
        case .search:
            return "/3/search/movie"
            
        }
    }
}
