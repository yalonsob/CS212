//
//  RPSGameViewController.swift
//  RockPaperScissor
//
//  Created by Yolanda Alonso on 10/7/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class RPSGameViewController: UIViewController {
    
    var playerMove: RPSMove?
    var myRPSGame: RPSGame!
    
    @IBOutlet var labelPlayerMove: UILabel!
    @IBOutlet var labelComputerMove: UILabel!
    @IBOutlet var labelResult: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let playerMove = self.playerMove {
            
            //Play game
            myRPSGame = RPSGame(playerMove: playerMove, computerMove: RPSMove.getRandomMove())
            let gameResult = myRPSGame.playRPS()
            
            //Display game info
            labelPlayerMove.text = myRPSGame.playerMove.rawValue
            labelComputerMove.text = myRPSGame.computerMove.rawValue
            labelResult.text = gameResult.rawValue
            
            switch gameResult {
                case .loss:
                    labelResult.textColor = UIColor.red
                case .win:
                    labelResult.textColor = UIColor.green
                default:
                    labelResult.textColor = UIColor.black
            }
        }
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
}
