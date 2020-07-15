//
//  AddBirthdayViewController.swift
//  BirthdayTracker
//
//  Created by Владимир Коваленко on 15.07.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import UIKit

class AddBirthdayViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNametextField: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        birthdatePicker.maximumDate = Date()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
               let firstName  = firstNameTextField.text ?? "FirstName PlaceHolder"
               let lastName = lastNametextField.text ?? "LastName PlaceHolder"
               let birthdate = birthdatePicker.date
        print("Save")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
