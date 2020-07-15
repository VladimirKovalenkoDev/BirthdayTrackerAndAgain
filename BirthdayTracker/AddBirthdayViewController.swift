//
//  AddBirthdayViewController.swift
//  BirthdayTracker
//
//  Created by Владимир Коваленко on 15.07.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import UIKit
import RealmSwift
class AddBirthdayViewController: UIViewController {
  let realm = try! Realm()
    
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
                let birthday = Birthday()
        birthday.firstName = firstName
        birthday.lastName = lastName
        birthday.birthDate = birthdate
                    do{
                          try realm.write{
                              realm.add(birthday)
                            print("DONE")
                          }
                      }catch{
                          print("error creating item")
                      }
         dismiss(animated: true, completion: nil)
               }
           /*
       
    }
    
  
       
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
