//
//  User+CoreDataProperties.swift
//  CoreDataEasy
//
//  Created by Oleksandr on 17.12.2019.
//  Copyright © 2019 Oleksandr. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var birthday: Date?
    @NSManaged public var hobby: String?
    @NSManaged public var devices: NSSet?

}

// MARK: Generated accessors for devices
extension User {

    @objc(addDevicesObject:)
    @NSManaged public func addToDevices(_ value: Device)

    @objc(removeDevicesObject:)
    @NSManaged public func removeFromDevices(_ value: Device)

    @objc(addDevices:)
    @NSManaged public func addToDevices(_ values: NSSet)

    @objc(removeDevices:)
    @NSManaged public func removeFromDevices(_ values: NSSet)

}
