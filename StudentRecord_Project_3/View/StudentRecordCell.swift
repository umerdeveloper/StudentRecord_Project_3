//
//  StudentRecordCell.swift
//  StudentRecord_Project_3
//
//  Created by Umer Khan on 31/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class StudentRecordCell: UITableViewCell {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var fatherNameLabel: UILabel!
    @IBOutlet weak var rollNoLabel: UILabel!
    @IBOutlet weak var contactNoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
