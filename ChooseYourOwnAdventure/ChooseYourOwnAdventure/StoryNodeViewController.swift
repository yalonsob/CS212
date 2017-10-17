//
//  StoryNodeViewController.swift
//  ChooseYourOwnAdventure
//
//  Created by Yolanda Alonso on 10/16/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class StoryNodeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Start Over",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(StoryNodeViewController.startOver))
    }
    
    @objc func startOver(){
        self.navigationController!.popToRootViewController(animated: true)
    }
}
