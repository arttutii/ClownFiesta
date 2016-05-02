//
//  ClueTableViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 12.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueTableViewController: UITableViewController {
    
    // MARK: Properties
    let gameMode: GameController = gameSingleton
    let detector = detectorSingleton
    let dataControl = dataManager

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background Image
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "BlueAppBackground"))
        
        // Fetch Games
        dataControl.fetchGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameMode.currentGameMode!.gameClues.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ClueTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ClueTableViewCell
        
        // Set the TableView contents
        cell.clueLabel.text = "Clue #\(indexPath.row + 1)"
        
        // Check if clue is found and set the image according to return
        if gameMode.currentGameMode?.gameClues[indexPath.row].clueFound == true {
            cell.clueFoundImage.image = UIImage(named: "ClueFound")
        } else {
            cell.clueFoundImage.image = UIImage(named: "ClueNotFound")
        }
    
        return cell
    }
    
    // Set the current game mode and pass it for the next View controller
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        gameMode.currentClue = gameMode.currentGameMode?.gameClues[indexPath.row]
        gameMode.currentClueInt = indexPath.row
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
}
