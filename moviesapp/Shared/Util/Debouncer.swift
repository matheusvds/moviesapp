//
//  Debouncer.swift
//  moviesapp
//
//  Created by matheus.v.sousa on 5/21/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import Foundation

class Debouncer: NSObject {
    
    var callback: (() -> ())
    var delay: Double
    weak var timer: Timer?
    
    init(delay: Double, callback: @escaping (() -> ())) {
        self.delay = delay
        self.callback = callback
    }
    
    func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(Debouncer.fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }
    
    func fireNow() {
        self.callback()
    }
}
