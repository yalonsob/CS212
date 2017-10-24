//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Yolanda Alonso on 10/24/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myHistory: [RPSMatch]! = []
    
    @IBOutlet var rock: UIButton!
    @IBOutlet var paper: UIButton!
    @IBOutlet var scissors: UIButton!
    
    private var buttonsToMoves = [UIButton : RPSMove]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "History",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(ViewController.navigateToHistory))
        
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
        let myRPSGame = RPSGame(playerMove: move, computerMove: RPSMove.getRandomMove())
        myRPSGameViewController.myRPSGame = myRPSGame
        self.addGameToHistory(myRPSGame: myRPSGame)
        self.present(myRPSGameViewController, animated: true, completion: nil)
    }
    
    func addGameToHistory (myRPSGame: RPSGame) {
        myHistory.append(
            RPSMatch(playerMove: myRPSGame.playerMove,
                     computerMove: myRPSGame.computerMove,
                     result: myRPSGame.playRPS())
        )
    }
    
    @objc func navigateToHistory(){
        self.performSegue(withIdentifier: "HistorySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyVC = segue.destination as! RPSHistoryViewController
        historyVC.myHistory = myHistory
    }

}

