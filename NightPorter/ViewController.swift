//
//  ViewController.swift
//  NightPorter
//
//  Created by Waihon Yew on 3/22/20.
//  Copyright © 2020 Waihon Yew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // Create array of tasks by frequency
    let dailyTasks: [Task] = [
        Task(frequency: .daily, title: "Check all windows", subtitle: "Windows must be closed", imageName: "windows", completed: false),
        Task(frequency: .daily, title: "Check all doors", subtitle: "Doors must be locked", imageName: "door", completed: false),
        Task(frequency: .daily, title: "Is the boiler fueled?", subtitle: "Refill fuel if below 30%", imageName: "boiler", completed: false),
        Task(frequency: .daily, title: "Check the mailbox", subtitle: "Collect any mail", imageName: "mailbox", completed: false),
        Task(frequency: .daily, title: "Empty trash containers", subtitle: "Wash the containers as well", imageName: "trashcontainer", completed: false),
        Task(frequency: .daily, title: "If freezing, check water pipes", subtitle: "Ensure water flows", imageName: "waterpipes", completed: false),
        Task(frequency: .daily, title: "Document \"strange & unusual\" occurrences", subtitle: "Capture with date & time", imageName: "notebook", completed: false)
    ]

    let weeklyTasks: [Task] = [
        Task(frequency: .weekly, title: "Check inside all cabins", subtitle: "Bring along cabin keys", imageName: "cabins", completed: false),
        Task(frequency: .weekly, title: "Flush all lavatories in cabins", subtitle: "Close the door of lavatories", imageName: "lavatory", completed: false),
        Task(frequency: .weekly, title: "Walk the perimeter of property", subtitle: "Bring along torch light", imageName: "perimeter", completed: false)
    ]

    let monthlyTasks: [Task] = [
        Task(frequency: .monthly, title: "Test security alarm", subtitle: "Call security firm if not working", imageName: "securityalarm", completed: false),
        Task(frequency: .monthly, title: "Test motion detectors", subtitle: "Call security firm if not working", imageName: "motiondetector", completed: false),
        Task(frequency: .monthly, title: "Test smoke alarms", subtitle: "Call fire department if not working", imageName: "smokealarm", completed: false)
    ]

    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    // Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            // Find the right task and set it to completed
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            
            tableView.reloadData()
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    // Table View Data Source Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
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
        let tasksArray: [Task]?
        let imageView: UIImage?
        
        switch indexPath.section {
        case 0:
            tasksArray = dailyTasks
            imageView = UIImage(named: "dailyTask")!
        case 1:
            tasksArray = weeklyTasks
            imageView = UIImage(named: "weeklyTask")!
        case 2:
            tasksArray = monthlyTasks
            imageView = UIImage(named: "monthlyTask")!
        default:
            tasksArray = nil
            imageView = nil
        }

        let currentTask: Task! = tasksArray?[indexPath.row]
        cell.textLabel?.text = currentTask.title
        cell.detailTextLabel?.text = currentTask.subtitle
        cell.imageView?.image = imageView
        
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.detailTextLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.black
            cell.accessoryType = .disclosureIndicator
        }
        
        cell.backgroundColor = UIColor.clear
        
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Night Porter"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var tasks: [Task]?
        if let indexPath = self.tableView.indexPathForSelectedRow {
            switch indexPath.section {
            case Frequency.daily.rawValue:
                tasks = dailyTasks
            case Frequency.weekly.rawValue:
                tasks = weeklyTasks
            case Frequency.monthly.rawValue:
                tasks = monthlyTasks
            default:
                tasks = nil
            }
            if tasks != nil {
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.currentTask = tasks![indexPath.row]
            }
        }
    }
}

