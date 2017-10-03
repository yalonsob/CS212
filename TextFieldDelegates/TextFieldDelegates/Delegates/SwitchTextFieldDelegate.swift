//
//  SwitchTextFieldDelegate.swift
//  TextFieldDelegates
//
//  Created by Yolanda Alonso on 10/3/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation
import UIKit

class SwitchTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
}
