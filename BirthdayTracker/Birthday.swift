//
//  Birthday.swift
//  BirthdayTracker
//
//  Created by Владимир Коваленко on 15.07.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import Foundation
import RealmSwift


class Birthday : Object{
    @objc  dynamic var firstName : String = ""
    @objc  dynamic var lastName : String = ""
    @objc  dynamic var birthDate: Date = Date()
   // var parentCategory = LinkingObjects(fromType: BList.self, property: "birthdays")
}
