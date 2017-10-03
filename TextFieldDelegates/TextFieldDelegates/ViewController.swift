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
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var switchForText3: UISwitch!
    
    //TextField Delegate Objects
    let fiveCharDelegate = FiveCharTextFieldDelegate()
    let dollarsDelegate = DollarsTextFieldDelegate()
    let switchDelegate = SwitchTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the delegates
        textField1.delegate = fiveCharDelegate
        textField2.delegate = dollarsDelegate
        textField3.delegate = switchDelegate
        
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        textField3.isEnabled = switchForText3.isOn
    }
}

