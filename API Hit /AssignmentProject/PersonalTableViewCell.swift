//
//  PersonalTableViewCell.swift
//  AssignmentProject
//
//  Created by Intern on 16/05/19.
//  Copyright © 2019 Hardeep Singh. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var id: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
