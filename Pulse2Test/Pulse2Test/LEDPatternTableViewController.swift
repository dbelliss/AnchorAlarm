//
//  LEDPatternTableViewController.swift
//  Pulse2Test
//
//  Created by Seonman Kim on 12/10/15.
//  Copyright © 2015 Harman International. All rights reserved.
//

import UIKit

class LEDPatternTableViewController: UITableViewController {
    
//    var currentGenre = "Politics"
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        currentGenre = appDelegate.genre
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LEDPatternNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LEDPattern_Cell", forIndexPath: indexPath)
        cell.textLabel?.text = LEDPatternNames[indexPath.row]
        
        if indexPath.row == g_ledPatternID.rawValue {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        g_ledPatternID = HMNPattern(rawValue: indexPath.row)!
        if g_ledPatternID ==  HMNPattern.FireFly || g_ledPatternID == HMNPattern.Canvas {
            let imageMatrix = [
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	1,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0
            ];
            
            var array = [NSNumber]()
            for (var i = 0; i < LED_COUNT; i++) {
                array.append(imageMatrix[i])
            }
            HMNLedControl.setLedPattern(g_ledPatternID, withData: array)
        }
        else {
            HMNLedControl.setLedPattern(g_ledPatternID, withData: nil)
        }
        MainTableViewControllerShared.ledInfoLabel.text = LEDPatternNames[g_ledPatternID.rawValue]
        tableView.reloadData()
        
    }
    
    
    
    
    
    
}
