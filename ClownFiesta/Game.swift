//
//  Game.swift
//  ClownFiesta
//
//  Created by iosdev on 8.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

class Game {
    
    var gameName: String?
    var gameClues = [Clue]()
    var gameLocation: String?
    var gameDescription: String?
    
    
    
    init(GameName: String, GameClues: [Clue], GameLocation: String, GameDescription: String) {
        self.gameName = GameName
        self.gameClues = GameClues
        self.gameLocation = GameLocation
        self.gameDescription = GameDescription
    }
    
    /* Un-used, save for future
    func setVariables(GameName: String, GameClues: [Clue], GameLocation: String, GameDescription: String) {
        self.gameName = GameName
        self.gameClues = GameClues
        self.gameLocation = GameLocation
        self.gameDescription = GameDescription
    } */
    
}