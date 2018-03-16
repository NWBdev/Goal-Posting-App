//
//  GoalCell.swift
//  Goal Posting
//
//  Created by Nathaniel Burciaga on 3/14/18.
//  Copyright © 2018 Nathaniel Burciaga. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

   //Outlets
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    func configureCell (description: String, type: String, goalProgressAmount: Int) {
        self.goalDescriptionLbl.text = description
        self.goalTypeLbl.text = type
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
