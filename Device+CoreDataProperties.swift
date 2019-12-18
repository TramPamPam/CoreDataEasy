//
//  Device+CoreDataProperties.swift
//  CoreDataEasy
//
//  Created by Oleksandr on 17.12.2019.
//  Copyright © 2019 Oleksandr. All rights reserved.
//
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var id: String?
    @NSManaged public var model: String?
    @NSManaged public var year: Int64
    @NSManaged public var owner: User?

}
