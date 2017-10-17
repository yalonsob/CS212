//
//  BlueViewController.swift
//  SimpleNavigation
//
//  Created by Yolanda Alonso on 10/12/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    @IBOutlet var theLabel: UILabel!
    var message: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        theLabel.text = message
    }
}
