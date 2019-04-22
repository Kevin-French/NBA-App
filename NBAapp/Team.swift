//
//  Team.swift
//  NBAapp
//
//  Created by Parth Dhebar on 3/27/19.
//  Copyright © 2019 Parth Dhebar. All rights reserved.
//

import Foundation

struct Team {
    var name: String
    var seed: Int
    var conference: Conference
    
    init(teamName: String, teamSeed: Int, teamConference: Conference) {
        self.name = teamName
        self.seed = teamSeed
        self.conference = teamConference
    }
    
}
