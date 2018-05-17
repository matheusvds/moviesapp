//
//  Result.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/7/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
