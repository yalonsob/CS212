//
//  RPSGame.swift
//  RockPaperScissor
//
//  Created by Yolanda Alonso on 10/7/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation

enum RPSMove: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    static func getRandomMove() -> RPSMove {
        let value = Int(arc4random()) % 3
        
        switch value {
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
        }
    }
}

enum RPSResult: String {
    case win = "WIN"
    case loss = "LOSS"
    case tie = "TIE"
}

class RPSGame {
    var playerMove: RPSMove
    var computerMove: RPSMove
    
    func playRPS() -> RPSResult {
        if computerMove == playerMove {
            return .tie
        }
        
        if (playerMove == .paper && computerMove == .scissors) ||
            (playerMove == .scissors && computerMove == .rock) ||
            (playerMove == .rock && computerMove == .paper) {
            return .loss
        }
        
        return .win
    }
    
    init(playerMove: RPSMove, computerMove: RPSMove) {
        self.playerMove = playerMove
        self.computerMove = computerMove
    }
}
