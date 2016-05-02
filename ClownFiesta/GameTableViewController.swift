//
//  GameTableViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 8.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {
    
    // MARK: Properties
    let gameMode: GameController = gameSingleton
    let detector: BeaconDetective = detectorSingleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background Image
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "PurpleAppBackground"))
        
        // Hides the navigation back button and create custom push button in navigation bar
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Game Menu", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(sender: UIBarButtonItem) {
        performSegueWithIdentifier("gamesToMenu", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameMode.games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "GameTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GameTableViewCell
        let game = gameMode.games[indexPath.row]
        
        // Set the TableView contents
        cell.gameLabel.text = game.gameName
        cell.gameDescription.text = game.gameDescription
        cell.gameDescription.numberOfLines = 0
        
        return cell
    }
    
    // Set the current game mode and pass it for the next View controller
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        gameMode.currentGameMode = gameMode.games[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
}
