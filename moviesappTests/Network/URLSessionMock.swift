//
//  URLSessionMock.swift
//  moviesappTests
//
//  Created by matheus.v.sousa on 5/9/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import moviesapp


extension QuickSpec {
    
    static func loadJson(fromFileName fileName: String) -> Data {
        let bundle = Bundle(for: moviesappTests.self)
        let filePath = bundle.path(forResource: fileName, ofType: "json")!
        return try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .uncached)
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping ()-> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var data: Data?
    var error: Error?
    var response: URLResponse?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        let data = self.data
        let error = self.error
        let response = self.response
        
        return URLSessionDataTaskMock {
            completionHandler(data, response, error)
        }
    }
}
