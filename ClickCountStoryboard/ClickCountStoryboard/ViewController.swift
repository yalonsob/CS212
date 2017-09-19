//
//  ViewController.swift
//  ClickCountStoryboard
//
//  Created by Yolanda Alonso on 9/14/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = Counter(initialValue: 0)

    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view loaded")
        countLabel.text = String(counter.value)
    }
    
    @IBAction func incrementButton(_ sender: UIButton) {
        counter.increment()
        print("\(counter.value)")
        countLabel.text = String(counter.value)
    }
    @IBAction func increment1000Button(_ sender: UIButton) {
        counter.increment1000()
        print("\(counter.value)")
        countLabel.text = String(counter.value)
    }
    
    @IBAction func incrementCheatButton(_ sender: UIButton) {
        counter.increment(x: 200)
        print("\(counter.value)")
        countLabel.text = String(counter.value)
    }
}

