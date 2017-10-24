//
//  RPSMatch.swift
//  HistoryRockPaperScissors
//
//  Created by Yolanda Alonso on 10/24/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import Foundation

class RPSMatch {
    var playerMove: RPSMove
    var computerMove: RPSMove
    var result: RPSResult
    
    init(playerMove: RPSMove, computerMove: RPSMove, result: RPSResult) {
        self.playerMove = playerMove
        self.computerMove = computerMove
        self.result = result
    }
}

