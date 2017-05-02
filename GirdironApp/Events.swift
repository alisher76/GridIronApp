//
//  Events.swift
//  GirdironApp
//
//  Created by Alisher Abdukarimov on 4/24/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import Foundation

enum ScoringEvent: Int {
    
    case touchDown
    case extraPoint
    case twoPointConversions
    case fieldGoal
    case safety
    case gaveTheBallAway
    
    var pointValue: Int {
        switch self {
        case .touchDown:
            return 6
        case .extraPoint:
            return 1
        case .twoPointConversions, .safety:
            return 2
        case .fieldGoal:
            return 3
        case .gaveTheBallAway:
            return 0
            
        }
        
    }
    
}

typealias Team = String

struct Game: Equatable {
    var team1: Team
    var team2: Team
    var scoringEventsTeam1 = [ScoringEvent]()
    var scoringEventsTeam2 = [ScoringEvent]()
    
    
    init(game team1: Team, and team2: Team, score: (team1: [ScoringEvent], team2: [ScoringEvent])){
        self.team1 = team1
        self.team2 = team2
        self.scoringEventsTeam1 = score.team1
        self.scoringEventsTeam2 = score.team2
        
    }
    
    
    
    
    static func ==(lhs: Game, rhs: Game) -> Bool{
        return lhs.scoringEventsTeam1 == rhs.scoringEventsTeam1 && lhs.scoringEventsTeam2 == rhs.scoringEventsTeam2 && rhs.team1 == lhs.team1 && rhs.team2 == lhs.team2
        
}

    func requestScore(of team: Team) -> Int? {
        
        var teamScore = 0
        
        switch team {
        case team1:
            for i in scoringEventsTeam1{
                teamScore += i.rawValue
            }
        case team2:
            for i in scoringEventsTeam2{
                teamScore += i.rawValue
            }
        default:
            return nil
        }
        return teamScore
        
    }
    
}

func record(_ event: ScoringEvent, for team: Team, in game: Game) -> Game?{
    
    var newGame = game
    
    switch team {
    case game.team1:
        newGame.scoringEventsTeam1.append(event)
    case game.team2:
        newGame.scoringEventsTeam2.append(event)
    default:
        return nil
        
    }
    return newGame
}



