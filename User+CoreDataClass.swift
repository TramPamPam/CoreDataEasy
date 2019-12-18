//
//  User+CoreDataClass.swift
//  CoreDataEasy
//
//  Created by Oleksandr on 17.12.2019.
//  Copyright © 2019 Oleksandr. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    var devicesArray: [Device] {
        devices?.allObjects as? [Device] ?? []
    }
}
