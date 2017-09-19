//
//  Calculator.swift
//  Calculator
//
//  Created by Yolanda Alonso on 9/18/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation


enum CalculatorOperator: Character {
    case Add = "+"
    case Subtract = "-"
    case Multiply = "*"
    case Divide = "/"
    case Clear = "C"
    case Equals = "="
}

protocol CalculatorProtocol {
    var display: String {get}
    
    func processDigit(digit: Int)
    func processOperator(value: CalculatorOperator)
}

class Calculator: CalculatorProtocol {
    private var _display: String
    private var errorMessage = "ERROR"
    var display: String {
        get {
            return _display
        }
    }
    
    init() {
        _display = "0"
    }
    
    func processDigit(digit: Int) {
        if (display == "0") {
            _display = String(digit)
        } else {
            _display = _display + String(digit)
        }
    }
    
    func processOperator(value: CalculatorOperator) {
        switch value {
            case .Equals:
                if (!isValidInput()) {
                    _display = errorMessage
                    return
                }
                let result: Float? = evaluateExpression()
                if (result == nil) {
                    _display = errorMessage
                    return
                }
                _display = String(result!)
                
            case .Clear:
                _display = "0"
            
            default:
                _display = _display + String(value.rawValue)
        }
    }
    
    private func evaluateExpression() -> Float? {
        let mathExpression = NSExpression(format: _display)
        let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Float
        return mathValue
    }
    
    //It considers a valid input when the last character is a digit
    private func isValidInput() -> Bool {
        let lastInputChar = _display[_display.index(before: _display.endIndex)]
        if (Int(String(lastInputChar)) != nil) {
            return true
        }
        return false
    }
}
