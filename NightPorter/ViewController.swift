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
    @IBOutlet weak var tasksTableView: UITableView!
    
    // Create array of tasks by frequency
    let dailyTasks: [Task] = [
        Task(frequency: .daily, title: "Check all windows", subtitle: "Windows must be closed", imageName: "windows"),
        Task(frequency: .daily, title: "Check all doors", subtitle: "Doors must be locked", imageName: "door"),
        Task(frequency: .daily, title: "Is the boiler fueled?", subtitle: "Refill fuel if below 30%", imageName: "boiler"),
        Task(frequency: .daily, title: "Check the mailbox", subtitle: "Collect any mail", imageName: "mailbox"),
        Task(frequency: .daily, title: "Empty trash containers", subtitle: "Wash the containers as well", imageName: "trashcontainer"),
        Task(frequency: .daily, title: "If freezing, check water pipes", subtitle: "Ensure water flows", imageName: "waterpipes"),
        Task(frequency: .daily, title: "Document \"strange & unusual\" occurrences", subtitle: "Capture with date & time", imageName: "notebook")
    ]

    let weeklyTasks: [Task] = [
        Task(frequency: .weekly, title: "Check inside all cabins", subtitle: "Bring along cabin keys", imageName: "cabins"),
        Task(frequency: .weekly, title: "Flush all lavatories in cabins", subtitle: "Close the door of lavatories", imageName: "lavatory"),
        Task(frequency: .weekly, title: "Walk the perimeter of property", subtitle: "Bring along torch light", imageName: "perimeter")
    ]

    let monthlyTasks: [Task] = [
        Task(frequency: .monthly, title: "Test security alarm", subtitle: "Call security firm if not working", imageName: "securityalarm"),
        Task(frequency: .monthly, title: "Test motion detectors", subtitle: "Call security firm if not working", imageName: "motiondetector"),
        Task(frequency: .monthly, title: "Test smoke alarms", subtitle: "Call fire department if not working", imageName: "smokealarm")
    ]

    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func resetList(_ sender: Any) {
        let confirm = UIAlertController(title: "Alert", message: "Really reset the list?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
            action in
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            
            for i in 0..<self.monthlyTasks.count {
                self.monthlyTasks[i].completed = false
            }
            
            self.tasksTableView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("That was a close one!")
        }
        
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        present(confirm, animated: true, completion: nil)
    }
    
    // Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var task: Task?
        // Find the right task being swiped
        switch indexPath.section {
        case Frequency.daily.rawValue:
            task = self.dailyTasks[indexPath.row]
        case Frequency.weekly.rawValue:
            task = self.weeklyTasks[indexPath.row]
        case Frequency.monthly.rawValue:
            task = self.monthlyTasks[indexPath.row]
        default:
            task = nil
        }
        
        guard let currentTask = task else {
            return nil
        }
        
        guard !currentTask.completed else {
            return nil
        }
        
        let completeAction = UIContextualAction(style: .normal, title: "Complete") {
            (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            currentTask.completed = true
            
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

