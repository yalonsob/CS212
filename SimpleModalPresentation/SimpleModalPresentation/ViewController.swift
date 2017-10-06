//
//  ViewController.swift
//  SimpleModalPresentation
//
//  Created by Yolanda Alonso on 10/5/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Red VC. View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Red VC. View Did Appear")
        
    }
    
    @IBAction func presentOrangeViewController() {
        print("Red VC. Present Orange View Controller")
        
        //Get an "Orange" view controller from Storyboard
        let newOrangeVC = self.storyboard!.instantiateViewController(withIdentifier: "Orange") as! OrangeViewController
        //Configure it
        newOrangeVC.view.backgroundColor = (count % 2 == 0) ? UIColor.orange : UIColor.green
        count += 1
        newOrangeVC.message = String(count)
        
        //Present it
        self.present(newOrangeVC, animated: true, completion: nil)
    }

}

