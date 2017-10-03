//
//  DollarsTextFieldDelegate.swift
//  TextFieldDelegates
//
//  Created by Yolanda Alonso on 10/2/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation
import UIKit

class DollarsTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newNSText: NSString = textField.text! as NSString
        newNSText = newNSText.replacingCharacters(in: range, with: string) as NSString
        
        textField.text = toDollars(newNSString: newNSText)
        return false
    }
    
    private func toDollars(newNSString: NSString) -> String  {
        
        var newString: String
        
        newString = toOnlyDigits(originalString: newNSString as String)
        newString = adjustZeros(digitString: newString)
        newString = addDollarSymbols(digitString: newString)
        
        return newString
    }
    
    //It allows only digits in the string
    private func toOnlyDigits(originalString: String) -> String {
        var auxString: String
        var onlyDigitsString: String = ""
        
        auxString = originalString.replacingOccurrences(of: ".", with: "")
        auxString = auxString.replacingOccurrences(of: "$", with: "")
        
        for index in auxString.indices {
            if( isDigit(c: auxString[index]) ) {
                onlyDigitsString.append(auxString[index])
            }
        }
        
        return onlyDigitsString
    }
    
    private func isDigit(c: Character) -> Bool {
        if (c == "0" || c == "1" || c == "2" || c == "3" || c == "4" || c == "5" || c == "6" || c == "7" || c == "8" || c == "9") {
            return true
        }
        return false
    }
    
    //It adds or removes zeros at the beginning of the string
    private func adjustZeros(digitString: String) -> String {
        var correctZerosString: String = digitString
        let minimumDigits = 3
        var currentLength = correctZerosString.count
        
        //Option 1: it has too many zeros at beginning
        if (currentLength > minimumDigits) {
            correctZerosString = removeFirstZero(digitString: correctZerosString)
        }
        
        //Option 2: it needs zeros at beginning
        currentLength = correctZerosString.count
        if (currentLength < minimumDigits) {
            for _ in currentLength..<minimumDigits {
                correctZerosString = "0" + correctZerosString
            }
        }

        return correctZerosString
    }
    
    //Recursive function to remove all zeros at the beginning of the string
    private func removeFirstZero(digitString: String) -> String {
        var notExtraZerosString: String = digitString
        
        if (notExtraZerosString[notExtraZerosString.startIndex] == "0") {
                notExtraZerosString.remove(at: notExtraZerosString.startIndex)
                return removeFirstZero(digitString: notExtraZerosString)
        }
        return notExtraZerosString
    }
    
    //It adds the $ and . to the string
    private func addDollarSymbols(digitString: String) -> String {
        var newString = digitString
        newString = "$" + newString
        newString.insert(".", at: newString.index(before: newString.index(before: newString.endIndex)))
        return newString
    }
}
