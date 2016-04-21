//
//  GameController.swift
//  ClownFiesta
//
//  Created by iosdev on 20.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

let gameSingleton = GameController()
class GameController {

    // MARK: Properties
    var games = [Game]()
    var currentGameMode: Game?
    var currentClue: Clue?
    var appMap: Map
    
    private init (){
        appMap = Map(currentLatitude: appMap.currentLatitude, currentLongitude: 0.0)
    }
    
    func loadClues(GameMode: Game, Clues: [Clue]) {
        GameMode.gameClues = Clues
    }
    
    func loadGameModes() {
        games = []
        
        let game1 = Game(GameName: "Fiesta", GameClues: [], GameLocation: "Helsinki", GameDescription: "Fun Times!")
        let game2 = Game(GameName: "Clown", GameClues: [], GameLocation: "Helsinki", GameDescription: "Clown Around!")
        
        loadClues(game1, Clues: [
            Clue(des: "Hello"),
            Clue(des: "Wow")
            ])
        
        loadClues(game2, Clues: [
            Clue(des: "Oh my"),
            Clue(des: "Is it me you're looking for?")
            ])
        games += [game1, game2]
    }
}

