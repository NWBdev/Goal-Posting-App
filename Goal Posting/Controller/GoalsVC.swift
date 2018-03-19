//
//  GoalsVC.swift
//  Goal Posting
//
//  Created by Nathaniel Burciaga on 3/12/18.
//  Copyright © 2018 Nathaniel Burciaga. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var goals: [Goal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //fetch the goals
       fetchCoreDataObjects()
        // reload view for table view
        tableView.reloadData()
    }

    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                    
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //Actions
    @IBAction func addedGoalBtnWasPressed(_ sender: Any) {
        print("btn was pressed")
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
        
    }
    
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell() }
       
        let goal = goals[indexPath.row]
        
        
        cell.configureCell(goal: goal)
        return cell
    }
    
    // Allows for editing of the tableview
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // table view editing style is set to none (putting our own custom style)
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    // editing actions for tableview one is going to delete / and one is going to add
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
        
        return [deleteAction]
    }
    
}


extension GoalsVC {
    
    func removeGoal(atIndexPath IndexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[IndexPath.row])
        
        do {
            try managedContext.save()
            print("successfully removed goal")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
        
    }
    
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        //fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest) as! [Goal]
            print("Successfully fetched data.")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
        }
    }
    
}

