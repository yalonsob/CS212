//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Yolanda Alonso on 10/7/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rock: UIButton!
    @IBOutlet var paper: UIButton!
    @IBOutlet var scissors: UIButton!
    
    private var buttonsToMoves = [UIButton : RPSMove]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsToMoves[rock] = .rock
        buttonsToMoves[paper] = .paper
        buttonsToMoves[scissors] = .scissors
    }
    
    @IBAction func selectMove(sender: UIButton) {
        let move = buttonsToMoves[sender]!
        presentRPSGameViewController(move)
    }
    
    func presentRPSGameViewController(_ move: RPSMove){
        let myRPSGameViewController = self.storyboard!.instantiateViewController(withIdentifier: "RPSGame") as! RPSGameViewController
        myRPSGameViewController.playerMove = move
        self.present(myRPSGameViewController, animated: true, completion: nil)
    }

}

