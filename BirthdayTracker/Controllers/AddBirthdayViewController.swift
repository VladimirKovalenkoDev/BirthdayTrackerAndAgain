//
//  AddBirthdayViewController.swift
//  BirthdayTracker
//
//  Created by Владимир Коваленко on 15.07.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class AddBirthdayViewController: UIViewController  {
  let realm = try! Realm()
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNametextField: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameTextField.delegate = self
        self.lastNametextField.delegate = self
        birthdatePicker.maximumDate = Date()
        addButton.layer.cornerRadius = 5
    }
   
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Save Methods
    @IBAction func saveButtonPressed(_ sender: UIButton!) {
               let firstName  = firstNameTextField.text ?? "FirstName PlaceHolder"
               let lastName = lastNametextField.text ?? "LastName PlaceHolder"
               let birthdate = birthdatePicker.date
               let birthday = Birthday()
        birthday.firstName = firstName
        birthday.lastName = lastName
        birthday.birthDate = birthdate
        birthday.birthdayId = UUID().uuidString
        print(birthdate)
                    do{
                          try realm.write{
                              realm.add(birthday)
                            let message = "Today \(firstName) \(lastName) birthday! Say some nice words🎈"
                            let content = UNMutableNotificationContent()
                            content.body = message
                            content.sound = UNNotificationSound.default
                            var dateComponents = Calendar.current.dateComponents([.month, .day], from: birthdate)
                            dateComponents.hour = 8
                            
                            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                            if let identifier = birthday.birthdayId {
                                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                                let center = UNUserNotificationCenter.current()
                                center.add(request, withCompletionHandler: nil)
                            }
                          }
                      }catch{
                          print("error creating item")
                      }
         dismiss(animated: true, completion: nil)
        
               }
}

// MARK: - Text Field Delegate methods
extension AddBirthdayViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.endEditing(true)
        lastNametextField.endEditing(true)
        return true
    }
    
    
}
