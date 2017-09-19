//
//  Counter.swift
//  ClickCounter
//
//  Created by Yolanda Alonso on 9/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation

class Counter {
    
    private var _value: Int
    var value: Int {
        get {
            return _value
        }
    }
    
    init(initialValue: Int) {
        _value = initialValue
    }
    
    func increment() {
        _value += 1
    }
    
    func decrement() {
        _value -= 1
    }
    
    func reset() {
        _value = 0
    }
    
    func increment1000() {
        _value += 1000
    }
    
    func increment(x: Int) {
        _value += x
    }
}
