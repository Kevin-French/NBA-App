//
//  Series.swift
//  NBAapp
//
//  Created by Parth Dhebar on 3/27/19.
//  Copyright © 2019 Parth Dhebar. All rights reserved.
//

import Foundation

enum Conference: String {
    case western = "West"
    case eastern = "East"
}



struct Series {
    var team1: Team
    var team2: Team
    var games: [Game]
    var round: RoundNumber
    
    
    init(team1: Team, team2: Team, games: [Game], round: RoundNumber) {
        self.team1 = team1
        self.team2 = team2
        self.games = games
        self.round = round
    }
    
    
    // "Warriors lead 3-0"
    // "Bucks lead 2-1"
    // "Series Tied 1-1"
    // Series: Warrios 3 wins, Thunder 0 wins
    func recordString() -> String {
        let (team1Wins, team2Wins) = record()
        
        if team1Wins > team2Wins {
            return "\(team1.name) lead \(team1Wins)-\(team2Wins)"
        } else if team2Wins > team1Wins {
            return "\(team2.name) lead \(team1Wins)-\(team2Wins)"
        } else {
            return "Series tied \(team2Wins)-\(team1Wins)"
        }
    }
    
    // Want to return (3, 0) or (2, 1) or (1, 1)
    func record() -> (team1Wins: Int, team2Wins: Int) {
        
        var team1Wins = 0
        var team2Wins = 0

        // Figure out how many games a team has won and return that total
        for game in games {
            // Want to know who won
            let winningTeam = game.winningTeam()
            
            if winningTeam.name == team1.name {
              team1Wins += 1
            } else {
                team2Wins += 1
            }
        }
        
        
        return (team1Wins, team2Wins)
    }
    
    static func round1Series() -> (eastern: [Series], western: [Series]) {
        
        let warriors = Team(teamName: "Warriors", teamSeed: 1, teamConference: .western)
        let nuggets = Team(teamName: "Nuggets", teamSeed: 2, teamConference: .western)
        let trailBlazers = Team(teamName: "Trail Blazers", teamSeed: 3, teamConference: .western)
        let rockets = Team(teamName: "Rockets", teamSeed: 4, teamConference: .western)
        let clippers = Team(teamName: "Clippers", teamSeed: 5, teamConference: .western)
        let jazz = Team(teamName: "Jazz", teamSeed: 6, teamConference: .western)
        let thunder = Team(teamName: "Thunder", teamSeed: 7, teamConference: .western)
        let spurs = Team(teamName: "Spurs", teamSeed: 8, teamConference: .western)
        
        let bucks = Team(teamName: "Bucks", teamSeed: 1, teamConference: .eastern)
        let raptors = Team(teamName: "Raptors", teamSeed: 2, teamConference: .eastern)
        let seventySixers = Team(teamName: "76ers", teamSeed: 3, teamConference: .eastern)
        let pacers = Team(teamName: "Pacers", teamSeed: 4, teamConference: .eastern)
        let celtics = Team(teamName: "Celtics", teamSeed: 5, teamConference: .eastern)
        let nets = Team(teamName: "Nets", teamSeed: 6, teamConference: .eastern)
        let pistons = Team(teamName: "Pistons", teamSeed: 7, teamConference: .eastern)
        let magic = Team(teamName: "Magic", teamSeed: 8, teamConference: .eastern)
        
        let western1 = Series(team1: warriors, team2: spurs, games: [], round: .firstRound)
        let western2 = Series(team1: nuggets, team2: thunder, games: [], round: .firstRound)
        let western3 = Series(team1: trailBlazers, team2: jazz, games: [], round: .firstRound)
        let western4 = Series(team1: rockets, team2: clippers, games: [], round: .firstRound)
        
        let eastern1 = Series(team1: bucks, team2: magic, games: [], round: .firstRound)
        let eastern2 = Series(team1: raptors, team2: pistons, games: [], round: .firstRound)
        let eastern3 = Series(team1: seventySixers, team2: nets, games: [], round: .firstRound)
        let eastern4 = Series(team1: pacers, team2: celtics, games: [], round: .firstRound)
        
        return ([eastern1, eastern2, eastern3, eastern4], [western1, western2, western3, western4])
    }

}
