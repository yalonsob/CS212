//
//  FiveCharTextFieldDelegate.swift
//  TextFieldDelegates
//
//  Created by Yolanda Alonso on 10/2/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation
import UIKit

class FiveCharTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 5
        var newText: NSString = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        if (newText.length > maxLength) {
            return false
        }
        return true
    }
}
