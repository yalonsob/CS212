//
//  ViewController.swift
//  TextFieldDelegates
//
//  Created by Yolanda Alonso on 10/2/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Outlets
    @IBOutlet weak var textField1: UITextField!
    
    //TextField Delegate Objects
    let fiveCharDelegate = FiveCharTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the delegates
        textField1.delegate = fiveCharDelegate
    }
}

