//
//  FormViewController.swift
//  StudentRecord_Project_3
//
//  Created by Umer Khan on 31/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//
import UIKit
import CoreData


class FormViewController: UIViewController {
    
    // MARK: - UI Properties
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var fatherNameTextField: UITextField!
    @IBOutlet weak var rollNoTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    
    // MARK: - CoreData Entity Keys
    private let dbEntityName: String = "Student"
    private let nameKey: String = "name"
    private let fatherNameKey: String = "fatherName"
    private let rollNoKey: String = "rollNumber"
    private let contactNoKey: String = "contactNumber"
    
    // MARK: - Supporting Properties
    private let emptyTextField: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.becomeFirstResponder()
    }
    
    @IBAction func submitFormButtonTapped(_ sender: UIButton) {
        resignFirstResponder()
        persistData()
    }
    
    func persistData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: dbEntityName, in: context)!
        let newStudent = NSManagedObject(entity: entity, insertInto: context)
        
        // TODO: Insert Data
        insertData(student: newStudent)
        // TODO: Save Data
        do { try context.save() }
        catch { showAlertToUser(message: "Failed to save data.") }
    }
    
    func insertData(student: NSManagedObject) {
        if AreTextFieldsNill() {
            showAlertToUser(message: "All Fields Required.")
        } else {
            student.setValue(fullNameTextField.text, forKey: nameKey)
            student.setValue(fatherNameTextField.text, forKey: fatherNameKey)
            student.setValue(Int64(rollNoTextField.text!), forKey: rollNoKey)
            student.setValue(Int64(contactTextField.text!), forKey: contactNoKey)
            showAlertToUser(message: "Student Record Saved")
            refreshTextFields()
        }
    }

    func AreTextFieldsNill() -> Bool {
        if  fullNameTextField.text == emptyTextField ||
            fatherNameTextField.text == emptyTextField ||
            rollNoTextField.text == emptyTextField ||
            contactTextField.text == emptyTextField { return true }
        else { return false }
    }
    
    func refreshTextFields() {
        fullNameTextField.text = emptyTextField
        fatherNameTextField.text = emptyTextField
        rollNoTextField.text = emptyTextField
        contactTextField.text = emptyTextField
    }
    
    // MARK: - AlertController
    func showAlertToUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
