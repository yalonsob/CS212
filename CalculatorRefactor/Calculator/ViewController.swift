//
//  ViewController.swift
//  Calculator
//
//  Created by Yolanda Alonso on 9/18/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculator = Calculator()

    @IBOutlet weak var txtDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDisplay.text = calculator.display
    }

    @IBAction func processZero(_ sender: UIButton) {
        calculator.processDigit(digit: 0)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processOne(_ sender: UIButton) {
        calculator.processDigit(digit: 1)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processTwo(_ sender: UIButton) {
        calculator.processDigit(digit: 2)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processThree(_ sender: UIButton) {
        calculator.processDigit(digit: 3)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processFour(_ sender: UIButton) {
        calculator.processDigit(digit: 4)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processFive(_ sender: UIButton) {
        calculator.processDigit(digit: 5)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processSix(_ sender: UIButton) {
        calculator.processDigit(digit: 6)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processSeven(_ sender: UIButton) {
        calculator.processDigit(digit: 7)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processEight(_ sender: UIButton) {
        calculator.processDigit(digit: 8)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processNine(_ sender: UIButton) {
        calculator.processDigit(digit: 9)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processClear(_ sender: UIButton) {
        calculator.processOperator(value: .Clear)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processEquals(_ sender: UIButton) {
        calculator.processOperator(value: .Equals)
        txtDisplay.text = calculator.display
    }

    @IBAction func processAdd(_ sender: UIButton) {
        calculator.processOperator(value: .Add)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processSubtract(_ sender: UIButton) {
        calculator.processOperator(value: .Subtract)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processMultiply(_ sender: UIButton) {
        calculator.processOperator(value: .Multiply)
        txtDisplay.text = calculator.display
    }
    
    @IBAction func processDivide(_ sender: UIButton) {
        calculator.processOperator(value: .Divide)
        txtDisplay.text = calculator.display
    }
}

