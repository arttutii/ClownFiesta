//
//  Leaderboard.swift
//  ClownFiesta
//
//  Created by iosdev on 29.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

let leaderboardSingleton = Leaderboard()

class Leaderboard {

    var leaderboard = [LeaderboardPlayers]()
    
    private init() {
    
    }
    
    func loadLeaderboard(){
        leaderboard = []
        
        let player1 = LeaderboardPlayers(playerName: "Arttu", playerScore: 10500)
        let player2 = LeaderboardPlayers(playerName: "Oliver", playerScore: 9000)
        let player3 = LeaderboardPlayers(playerName: "Daniel", playerScore: 8950)
        let player4 = LeaderboardPlayers(playerName: "Teemu", playerScore: 4750)
        let player5 = LeaderboardPlayers(playerName: "Mortti", playerScore: 3250)
        let player6 = LeaderboardPlayers(playerName: "Eemeli", playerScore: 2750)
        let player7 = LeaderboardPlayers(playerName: "Julius", playerScore: 2450)
        let player8 = LeaderboardPlayers(playerName: "John", playerScore: 1850)
        let player9 = LeaderboardPlayers(playerName: "Stuart", playerScore: 1650)
        let player10 = LeaderboardPlayers(playerName: "Cole", playerScore: 1550)
        let player11 = LeaderboardPlayers(playerName: "Doug", playerScore: 1250)
        let player12 = LeaderboardPlayers(playerName: "Clayton", playerScore: 1150)
        let player13 = LeaderboardPlayers(playerName: "Randy", playerScore: 950)
        let player14 = LeaderboardPlayers(playerName: "Chris", playerScore: 350)
        let player15 = LeaderboardPlayers(playerName: "Matti", playerScore: 100)
    
        leaderboard += [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15]
    }
}