//
//  LeaderboardTableViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 29.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class LeaderboardTableViewController: UITableViewController {
    
    // MARK: Properties
    // Leaderboard is hard coded as we did not use a Back-End for our application,
    // this should be worked on as an improvement for our application yet 
    // we wanted to have a working game that functions offline.
    let leaderboardInstance = leaderboardSingleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the values of the leaderboard
        leaderboardInstance.loadLeaderboard()
        
        // Set the View background Image
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "PurpleAppBackground"))
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
        return leaderboardInstance.leaderboard.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "LeaderboardTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! LeaderboardTableViewCell
        cell.playerName.text = leaderboardInstance.leaderboard[indexPath.row].playerName
        cell.playerScore.text = String(leaderboardInstance.leaderboard[indexPath.row].playerScore)
        
        // Check the position and return the correct String
        if (indexPath.row + 1) == 1 {
            cell.playerPosition.text = "\(indexPath.row + 1)st"
            cell.leaderboardImage.image = UIImage(named: "Gold")
        } else if (indexPath.row + 1) == 2 {
            cell.playerPosition.text = "\(indexPath.row + 1)nd"
            cell.leaderboardImage.image = UIImage(named: "Silver")
        } else if (indexPath.row + 1) == 3 {
            cell.playerPosition.text = "\(indexPath.row + 1)rd"
            cell.leaderboardImage.image = UIImage(named: "Bronze")
        } else {
            cell.playerPosition.text = "\(indexPath.row + 1)th"
            cell.leaderboardImage.hidden = true
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
}
