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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //Actions
    @IBAction func addedGoalBtnWasPressed(_ sender: Any) {
        print("btn was pressed")
    }
    
    
}

