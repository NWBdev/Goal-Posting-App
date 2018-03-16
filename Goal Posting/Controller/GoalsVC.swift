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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell() }
        cell.configureCell(description: "Eat Salad twice a week", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
    
}
