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
        
        buttonsToMoves[rock] = RPSMove.rock
        buttonsToMoves[paper] = RPSMove.paper
        buttonsToMoves[scissors] = RPSMove.scissors
    }
    
    @IBAction func selectMove(sender: UIButton) {
        let move = buttonsToMoves[sender]!
        playMove(move)
    }
    
    func playMove(_ move: RPSMove){
        print(move.rawValue)
    }

}

