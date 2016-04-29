//
//  LeaderboardPlayers.swift
//  ClownFiesta
//
//  Created by iosdev on 29.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

class LeaderboardPlayers {

    var playerName: String
    var playerScore: Int
    
    init(playerName: String, playerScore: Int) {
        self.playerName = playerName
        self.playerScore = playerScore
    }
}