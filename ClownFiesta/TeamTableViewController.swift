//
//  TeamTableViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

let teamTableSingleton = TeamTableViewController()

class TeamTableViewController: UITableViewController{
    
    // MARK: Properties
    
    // Get Instances
    let dataControl = dataManager
    let teamControl = teamSingleton

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Used for reloading the table view container, inside the TeamViewController
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:", name: "load", object: nil)
        
        self.tableView.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadList(notification: NSNotification) {
        self.tableView.reloadData()
        print("Container data reloaded")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Checks the length of the teamMembers array and sets the rows.
        if dataControl.teamMembers.count == 0 {
            // If teamMembers was empty then the return was nil, therefore we set a check and return of 0.
            return 0
        } else {
            return dataControl.teamMembers.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TeamTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TeamTableViewCell
        
        // Set the tableView contents
        cell.memberNameLabel.text = dataControl.teamMembers[indexPath.row]
        print("membername: ",dataControl.teamMembers[indexPath.row])
        print("members count: ", dataControl.teamMembers.count)
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
    
}
