//
//  MainVC.swift
//  GirdironApp
//
//  Created by Alisher Abdukarimov on 4/24/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    var stringPassed: String?
    
    enum Team {
        case team1
        case team2
    }
    
    typealias Score = (team1Score: Int, team2Score: Int)
    
    
    @IBOutlet weak var currentTeamsTurnLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    
   
    
    @IBOutlet var team1ScoreLabel: UILabel!
    @IBOutlet var team2ScoreLabel: UILabel!
    @IBOutlet var movesDoneLabel: UILabel!
    
    var game: Score = (0,0)
    
    let scoringEvents = [6,1,2,3,0]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        updateDisplay()
    }
    var nextTurn = false
    
    @IBAction func letsGo(_ sender: Any) {
        let num :Int = Int(arc4random_uniform(4))
        if nextTurn == false {
            currentTeamsTurnLabel.text = "Team 2'S turn "
            game.team1Score += num
            nextTurn = true
        }else{
            currentTeamsTurnLabel.text = "Team 1'S turn "
            game.team2Score += num
            nextTurn = false
        }
        updateDisplay()
        movesDoneLabel.text = displayResultOftheMove(input: num)
    }
    
    
    
    
    func updateDisplay() {
        teamNameLabel.text = stringPassed
        team1ScoreLabel.text = String(game.team1Score)
        team2ScoreLabel.text = String(game.team2Score)
        
        
    }
    
   public func displayResultOftheMove(input: Int) -> String {
        
        switch input {
        case 6:
            return "Touch-Down Awesome Run"
        case 1:
            return "Extra point 1 is better than 0"
        case 2:
            return "Two Points still Good"
        case 3:
            return "Field Goal Great run"
        case 0:
            return "Gave the Ball Away"
        default:
            return "lets do it again"
            
        }
        
    }
}
