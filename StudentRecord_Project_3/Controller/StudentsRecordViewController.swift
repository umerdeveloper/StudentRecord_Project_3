//
//  StudentsRecordTableViewController.swift
//  StudentRecord_Project_3
//
//  Created by Umer Khan on 31/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class StudentsRecordViewController: UITableViewController {
    
    private let customCellID: String = "customCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}