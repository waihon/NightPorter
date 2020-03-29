//
//  ViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 3/22/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    // Table View Data Source Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        let textLabel: String
        let detailTextLabel: String?
        let imageView: UIImage?
        
        switch indexPath.section {
        case 0:
            textLabel = dailyTasks[indexPath.row][0]
            detailTextLabel = dailyTasks[indexPath.row][1]
            imageView = UIImage(named: "dailyTask")!
        case 1:
            textLabel = weeklyTasks[indexPath.row][0]
            detailTextLabel = weeklyTasks[indexPath.row][1]
            imageView = UIImage(named: "weeklyTask")!
        case 2:
            textLabel = monthlyTasks[indexPath.row][0]
            detailTextLabel = monthlyTasks[indexPath.row][1]
            imageView = UIImage(named: "monthlyTask")!
        default:
            textLabel = "This shouldn't happen"
            detailTextLabel = nil
            imageView = nil
        }

        cell.textLabel?.text = textLabel
        cell.detailTextLabel?.text = detailTextLabel
        cell.imageView?.image = imageView
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }

    // Create string array of tasks
    let dailyTasks: [[String]] = [
        ["Check all windows",
         "Windows must be closed"],
        ["Check all doors",
         "Doors must be locked"],
        ["Is the boiler fueled?",
         "Refill fuel if below 30%"],
        ["Check the mailbox",
         "Collect any mail"],
        ["Empty trash containers",
         "Wash the containers as well"],
        ["If freezing, check water pipes",
        "Ensure water flows"],
        ["Document \"strange & unusual\" occurrences",
         "Capture with date & time"],
    ]

    let weeklyTasks: [[String]] = [
        ["Check inside all cabins",
         "Bring along cabin keys"],
        ["Flush all lavatories in cabins",
         "Close the door of lavatories"],
        ["Walk the perimeter of property",
         "Bring along torch light"]
    ]

    let monthlyTasks: [[String]] = [
        ["Test security alarm",
         "Call security firm if not working"],
        ["Test motion detectors",
         "Call security firm if not working"],
        ["Test smoke alarms",
         "Call fire department if not working"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

