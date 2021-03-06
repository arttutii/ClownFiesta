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
    var currentClueInt: Int?
    
    private init (){
        
    }
    
    func loadClues(GameMode: Game, Clues: [Clue]) {
        GameMode.gameClues = Clues
    }
    
    func loadGameModes() {
        games = []
        
        let game1 = Game(GameName: "Fiesta", GameClues: [], GameLocation: "Helsinki", GameDescription: "Fun Times!")
        let game2 = Game(GameName: "Clown", GameClues: [], GameLocation: "Helsinki", GameDescription: "Clown Around!")
        let game3 = Game(GameName: "Sightseeing", GameClues: [], GameLocation: "Helsinki", GameDescription: "Enjoy the city's finest tourist destinations!")
        let game4 = Game(GameName: "Finest Cuisine", GameClues: [], GameLocation: "Helsinki", GameDescription: "Try some of Helsinki's most enjoyable restaurants")
        
        loadClues(game1, Clues: [
            Clue(des: "Hello", bMinor: 96, bMajor: 96 , lat: 60.0, long: 24.22),
            Clue(des: "Wow", bMinor: 96, bMajor: 96, lat: 60.2219863096813, long: 24.8049)
            ])
        
        loadClues(game2, Clues: [
            Clue(des: "Oh my", bMinor: 96, bMajor: 96, lat: 60.0, long: 24.22 ),
            Clue(des: "Is it me you're looking for?", bMinor: 96, bMajor: 96 , lat: 60.2219863096813, long: 24.8049)
            ])
        
        loadClues(game3, Clues: [
            Clue(des: "This large church is one of the most famous landmarks in Helsinki", bMinor: 96, bMajor: 96,  lat: 60.2219863096813, long: 24.8049),
            Clue(des: "A statue outside of an art museum", bMinor: 96, bMajor: 96, lat: 60.2219863096813, long: 24.8049),
            Clue(des: "A strangely shaped church", bMinor: 96, bMajor: 96, lat: 60.0, long: 24.22),
            Clue(des: "Stone carved depictions of Men holding globes", bMinor: 96, bMajor: 96, lat: 60.0, long: 24.22)
            ])
        
        loadClues(game4, Clues: [
            Clue(des: "Underneath the golden arches", bMinor: 96, bMajor: 96, lat: 60.0, long: 24.22),
            Clue(des: "In a hotel by a park", bMinor: 0, bMajor: 0, lat: 60.0, long: 24.22),
            Clue(des: "Find me if you can", bMinor: 96, bMajor: 96, lat: 60.0, long: 24.22)
            ])
        
        games += [game1, game2, game3, game4]
    }
}

