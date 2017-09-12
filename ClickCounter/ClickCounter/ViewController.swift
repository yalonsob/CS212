//
//  ViewController.swift
//  ClickCounter
//
//  Created by Yolanda Alonso on 9/11/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Counter!
    var labelClicks: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.counter = Counter(initialValue: 0)
        
        //Label
        let frame = CGRect(x: 125, y: 120, width: 100, height: 70)
        labelClicks = UILabel(frame: frame)
        labelClicks!.font = UIFont.systemFont(ofSize: 70)
        labelClicks!.text = "\(counter.value)"
        self.view.addSubview(labelClicks!)
        
        //Increment button
        let incrementButtonFrame = CGRect(x: 100, y: 220, width: 100, height: 50)
        let incrementButton = UIButton(type: .system)
        incrementButton.frame = incrementButtonFrame
        incrementButton.setTitle("Click", for: .normal)
        self.view.addSubview(incrementButton)
        incrementButton.addTarget(self, action: #selector(incrementCounter), for: .touchDown)
        
        //Decrement button
        let decrementButtonFrame = CGRect(x: 100, y: 270, width: 100, height: 50)
        let decrementButton = UIButton(type: .system)
        decrementButton.frame = decrementButtonFrame
        decrementButton.setTitle("Decrement", for: .normal)
        self.view.addSubview(decrementButton)
        decrementButton.addTarget(self, action: #selector(decrementCounter), for: .touchDown)

        //Reset button
        let resetButtonFrame = CGRect(x: 100, y: 320, width: 100, height: 50)
        let resetButton = UIButton(type: .system)
        resetButton.frame = resetButtonFrame
        resetButton.setTitle("Reset", for: .normal)
        self.view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetCounter), for: .touchDown)

    }
    
    func incrementCounter() {
        counter.increment()
        labelClicks!.text = "\(counter.value)"
    }
    
    func decrementCounter() {
        counter.decrement()
        labelClicks!.text = "\(counter.value)"
    }
    
    func resetCounter() {
        counter.reset()
        labelClicks!.text = "\(counter.value)"
    }
}

