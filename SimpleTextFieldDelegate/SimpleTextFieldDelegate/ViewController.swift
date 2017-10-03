//
//  ViewController.swift
//  SimpleTextFieldDelegate
//
//  Created by Yolanda Alonso on 9/28/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }

    
    //Text Field Delegate Methods
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("text field should begin editing")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Range starts at \(range.location) and has length: \(range.length)")
        print("Replacement string is \(string)")
        
        //let originalString: NSString = textField.text! as NSString
        //let completedString = originalString.replacingCharacters(in: range, with: string)
        //print("The completed string will be \(completedString)")
        //return !completedString.contains(" ")
        
        //Replace one character with other
        let originalString: NSString = textField.text! as NSString
        let completedString = originalString.replacingCharacters(in: range, with: string)
        print("The completed string will be \(completedString)")
        textField.text = completedString.replacingOccurrences(of: " ", with: "_")
        return false //Dont edit yourself I already put the correct text in
        
        //return true
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("text field should return")
        textField.resignFirstResponder() //the textfield is not on focus anymore -> keyboard hides
        return true
    }
}

