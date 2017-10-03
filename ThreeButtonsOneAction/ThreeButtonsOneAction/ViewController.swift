//
//  ViewController.swift
//  ThreeButtonsOneAction
//
//  Created by Yolanda Alonso on 9/28/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    
    private var buttonsToDigits = [UIButton : Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsToDigits[one] = 1
        buttonsToDigits[two] = 2
        buttonsToDigits[three] = 3
        
        /*self.buttonsToDigits = [
            one : 1,
            two : 2,
            three : 3
        ]*/
    }

    @IBAction func digitPressed(sender: UIButton) {
        let digit = buttonsToDigits[sender]!
        processDigit(digit)
    }
    
    func processDigit(_ digit: Int){
        print(digit)
    }
}

