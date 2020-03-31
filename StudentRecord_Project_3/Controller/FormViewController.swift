//
//  FormViewController.swift
//  StudentRecord_Project_3
//
//  Created by Umer Khan on 31/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var fatherNameTextField: UITextField!
    @IBOutlet weak var rollNoTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    
    private let emptyTextField: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.becomeFirstResponder()

    }
    
    @IBAction func submitFormButtonTapped(_ sender: UIButton) {
        resignFirstResponder()
        // Check if any textField is empty return
        if  fullNameTextField.text == emptyTextField ||
            fatherNameTextField.text == emptyTextField ||
            rollNoTextField.text == emptyTextField ||
            contactTextField.text == emptyTextField {
            showAlertToUser(message: "All fields required.")
            
            }
        else {
            
        }
    }
    
    func showAlertToUser(message: String) {
        let alert = UIAlertController(title: "Try Again", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    
    
    
    
    
}
