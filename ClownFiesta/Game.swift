//
//  Game.swift
//  ClownFiesta
//
//  Created by iosdev on 8.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

class Game {

    var GameName: String
    var GameClues = [Clue]()
    var GameLocation: String
    var GameDescription: String
    
    init(GameName: String, GameClues: [Clue], GameLocation: String, GameDescription: String) {
        self.GameName = GameName
        self.GameClues = GameClues
        self.GameLocation = GameLocation
        self.GameDescription = GameDescription
    }
    
    
}