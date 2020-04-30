//
//  ViewController.swift
//  The Night Porter
//
//  Created by Vinícius Furukawa Carvalho on 28/04/20.
//  Copyright © 2020 Vinícius Furukawa Carvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var taskTableView: UITableView!
    
    var dailyTasks = [Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Is the boiler fuled?", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "If freezing, check the water pipes", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Document \"strange and unusual\" occurrences", type: .daily, completed: false, lastCompleted: nil)]
    
    var weeklyTasks = [Task(name: "Check inside all cabins", type: .daily, completed: false, lastCompleted: nil),
                       Task(name: "Flush all lavatories cabins", type: .daily, completed: false, lastCompleted: nil),
                       Task(name: "Walk the perimeter of property", type: .daily, completed: false, lastCompleted: nil)]
    
    var monthlyTasks = [Task(name: "Test security alarm", type: .daily, completed: false, lastCompleted: nil),
                        Task(name: "Test motion detectors", type: .daily, completed: false, lastCompleted: nil),
                        Task(name: "Test smoke alarms", type: .daily, completed: false, lastCompleted: nil)]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = .clear
        
        return 3
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
        let cell = UITableViewCell()
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        
        cell.textLabel!.text = currentTask.name
        cell.backgroundColor = .clear
        
        if currentTask.completed {
            cell.textLabel?.textColor = .lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = .black
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") {
            (action: UIContextualAction, sourceView: UIView, actionPerfomed: (Bool) -> Void) in
            
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
            actionPerfomed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    @IBAction func resetList(_ sender: Any) {
        let confirm = UIAlertController(title: "Are You Sure?", message: "Really reset the list?", preferredStyle: .alert)
        
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
            
            self.taskTableView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel){
            action in
            print("noop")
        }
        
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        present(confirm, animated: true, completion: nil)
    }
    
    @IBAction func toogleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

