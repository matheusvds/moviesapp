//
//  String.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/17/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

extension String {
    func formatDate() -> String {
        let endingIndex = self.index(self.startIndex, offsetBy: 4)
        return String(self[..<endingIndex])
    }
    
    func removeLast(characters: Int) -> String {
        if (self.count < characters) { return self }
        let endingIndex = self.index(self.endIndex, offsetBy: -characters)
        return  String(self[..<endingIndex])
    }
}
