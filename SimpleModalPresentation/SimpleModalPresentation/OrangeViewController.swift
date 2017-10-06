//
//  OrangeViewController.swift
//  SimpleModalPresentation
//
//  Created by Yolanda Alonso on 10/5/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController {
    
    var message: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let message = self.message {
            label.text = message
        }
        
        print("Orange View Controller Did Appear")
    }
    
    
    
    @IBAction func dismissMe() {
        self.dismiss(animated: true, completion: nil)
    }
}
