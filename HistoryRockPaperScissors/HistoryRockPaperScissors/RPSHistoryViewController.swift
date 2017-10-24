//
//  HistoryViewController.swift
//  HistoryRockPaperScissors
//
//  Created by Yolanda Alonso on 10/24/17.
//  Copyright © 2017 Yolanda Alonso. All rights reserved.
//

import UIKit

class RPSHistoryViewController: UIViewController, UITableViewDataSource {
    var myHistory: [RPSMatch]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPSCell", for: indexPath) as! RPSMatchTableViewCell
        
        let match = myHistory[indexPath.row]
        
        cell.player.text = match.playerMove.rawValue
        cell.result.text = match.result.rawValue
        cell.computer.text = match.computerMove.rawValue
        
        switch match.result {
        case .loss:
            cell.result.textColor = UIColor.red
        case .win:
            cell.result.textColor = UIColor.green
        default:
            cell.result.textColor = UIColor.black
        }
        
        return cell
    }
}
