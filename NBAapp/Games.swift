//
//  Games.swift
//  NBAapp
//
//  Created by Parth Dhebar on 3/27/19.
//  Copyright © 2019 Parth Dhebar. All rights reserved.
//

import Foundation

struct Game {
    var homeTeam: Team
    var awayTeam: Team
    var homeScore: Int
    var awayScore: Int
    var numberofOT: Int
    
    init(homeTeam: Team, awayTeam: Team, homeScore: Int, awayScore: Int, numberofOT: Int) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.numberofOT = numberofOT
    }
    
    func winningTeam() -> Team {
        if homeScore > awayScore {
            return homeTeam
        } else {
            return awayTeam
        }
    }
}


enum GameNumber: Int {
    case one = 1, two, three, four, five, six, seven
}

enum RoundNumber: Int {
    case firstRound = 1
    case conferenceSemiFinals = 2
    case conferenceFinals = 3
    case NBAFinals = 4
    
    
}
