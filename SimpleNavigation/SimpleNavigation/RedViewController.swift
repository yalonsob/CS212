//
//  RedViewController.swift
//  SimpleNavigation
//
//  Created by Yolanda Alonso on 10/12/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func navigateToBlue() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "Blue")
        let blue = vc as! BlueViewController
        blue.message = "Brought to you by code."
        
        
        self.navigationController?.pushViewController(blue, animated: true)
    }
    
    @IBAction func navigateToBlueUsingManualSegue() {
        self.performSegue(withIdentifier: "ManualSegue1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let blue = segue.destination as! BlueViewController
        if segue.identifier == "ManualSegue1" {
            blue.message = "Brought to you by the manual segue"
        }
        if segue.identifier == "ActionSegue" {
            blue.message = "Brought to you by the action segue"
        }
        
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
