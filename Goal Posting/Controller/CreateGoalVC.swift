//
//  CreateGoalVC.swift
//  Goal Posting
//
//  Created by Nathaniel Burciaga on 3/16/18.
//  Copyright © 2018 Nathaniel Burciaga. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    //Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Actions
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
   

}
