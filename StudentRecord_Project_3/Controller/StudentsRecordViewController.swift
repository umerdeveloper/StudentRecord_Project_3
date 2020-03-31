//
//  StudentsRecordTableViewController.swift
//  StudentRecord_Project_3
//
//  Created by Umer Khan on 31/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit
import CoreData

class StudentsRecordViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var fetchedResultsController: NSFetchedResultsController<Student>!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = appDelegate.persistentContainer.viewContext
    private let customCellID: String = "customCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFetchedResultsController()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: customCellID, for: indexPath) as! StudentRecordCell
        guard let newStudent = self.fetchedResultsController?.object(at: indexPath) else {
               fatalError("Attempt to configure cell without a managed object")
           }
        
        cell.studentNameLabel.text = "Name: \(newStudent.name!)"
        cell.fatherNameLabel.text = "Father's Name: \(newStudent.fatherName!)"
        cell.rollNoLabel.text = "Roll No: \(String(newStudent.rollNumber))"
        cell.contactNoLabel.text = "Contact No: \(String(newStudent.contactNumber))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let fetchedResult = fetchedResultsController.object(at: indexPath)
            context.delete(fetchedResult)
            do { try context.save() }
            catch { fatalError() }
        }
    }
    
    
    // MARK: - FetchResultsController
    func initializeFetchedResultsController() {
        
        let request = NSFetchRequest<Student>(entityName: "Student")
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [nameSort]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
}

extension StudentsRecordViewController {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

        switch type {
        case .delete:
            self.tableView.deleteRows(at: [indexPath! as IndexPath], with: .fade)
            case .insert:
            print("")
            case .move:
            print("")
            case .update:
            print("")
            @unknown default:
            fatalError()
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
}
