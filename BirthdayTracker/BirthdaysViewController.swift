//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by Владимир Коваленко on 15.07.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import UIKit
import RealmSwift
class BirthdaysViewController: UITableViewController {

    let realm = try! Realm()
    var birthdays : Results<Birthday>?
    //var birthdays = [Birthday]()
    let dateFormatter = DateFormatter ()
    
    override func viewWillAppear(_ animated: Bool) {
       birthdays = realm.objects(Birthday.self)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return birthdays?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let birthday = birthdays?[indexPath.row]
        let firstName = birthday?.firstName
        let lastName  = birthday?.lastName
               cell.textLabel?.text = firstName! + "" + lastName!
        if let date = birthday?.birthDate {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        } else {
            cell.detailTextLabel?.text  = "birthday"
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          
           return true
       }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let item = birthdays?[indexPath.row]{
            do {
                try realm.write{
                    realm.delete(item)
                }
            } catch {
                print("Error deleting item, \(error)")
            }
            tableView.deleteRows(at: [indexPath] , with: .fade)
        }
    }
    
}

