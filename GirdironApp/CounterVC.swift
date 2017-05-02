//
//  CounterVC.swift
//  GirdironApp
//
//  Created by Alisher Abdukarimov on 4/29/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class CounterVC: UIViewController {
    
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var movesDisplayLabel: UILabel!
    @IBOutlet weak var teamOneButtonLabel: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        updateDisplay()
    }

    
    
    enum Team {
        case team1
        case team2
    }
    
    typealias Score = (team1Score: Int, team2Score: Int)
    
    
    var game: Score = (0,0)
    
    let scoringEvents = [6,1,2,3,0]
    
    var turn = false
    
    @IBAction func team1Button(_ sender: Any) {
       turn = false
       movesDisplayLabel.text = "Team 1st turn!"
    }
    @IBAction func team2Button(_ sender: Any) {
       turn = true
       movesDisplayLabel.text = "Team 2nd turn!"
    }
    
    func updateDisplay(){
         scoreLabel1.text = String(game.team1Score)
         scoreLabel2.text = String(game.team2Score)
    }
    
    
    
    @IBAction func touchDownTapped(_ sender: Any) {
        if turn == false {
        game.team1Score += 6
        movesDisplayLabel.text = "Touch Down for team1"
            updateDisplay()
        }else{
        game.team2Score += 6
            movesDisplayLabel.text = "Touch Down for team2"
            updateDisplay()
        }
    }
    @IBAction func fieldGoalTapped(_ sender: Any) {
        if turn == false {
            game.team1Score += 3
            movesDisplayLabel.text = "FieldGoal for team1"
            updateDisplay()
            
        }else{
            game.team2Score += 3
            movesDisplayLabel.text = "FieldGoal for team2"
            updateDisplay()
        }
    }
    @IBAction func twoPointsConversionTapped(_ sender: Any) {
        if turn == false {
            game.team1Score += 2
            movesDisplayLabel.text = "TwoPoints for team1"
            updateDisplay()
        }else{
            game.team2Score += 2
             movesDisplayLabel.text = "FieldGoal for team2"
            updateDisplay()
        }
    }
    @IBAction func safetyTapped(_ sender: Any) {
        if turn == false {
            game.team1Score += 2
             movesDisplayLabel.text = "Safety for team1"
            updateDisplay()
        }else{
            game.team2Score += 2
            movesDisplayLabel.text = "Safety for team2"
            updateDisplay()
        }
    }
    @IBAction func extraPointTapped(_ sender: Any) {
        if turn == false {
            game.team1Score += 1
            movesDisplayLabel.text = "Point for team1"
            updateDisplay()
        }else{
            game.team2Score += 1
            movesDisplayLabel.text = "Point for team2"
            updateDisplay()
        }
    }
    @IBAction func resetTapped(_ sender: Any) {
        game.team2Score = 0
        game.team1Score = 0
        movesDisplayLabel.text = "Game Reseted"
        updateDisplay()
    }
    
    
    
    
    
}
