//
//  DetailViewController.swift
//  Colors
//
//  Created by Yolanda Alonso on 10/26/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: UIColor? {
        didSet {
            // Update the view.
            self.view.backgroundColor = detailItem
        }
    }


}

