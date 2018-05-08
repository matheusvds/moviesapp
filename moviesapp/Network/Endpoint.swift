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
}

extension Endpoint {
    
    var apiKey: String {
        return "api_key=780517cdd65386623d21c096f42be2ba"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum MovieFeed {
    case popular
    case genres
}

extension MovieFeed: Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/3/movie/popular"
        case .genres:
            return "/3/genre/movie/list"
        }
    }
}
