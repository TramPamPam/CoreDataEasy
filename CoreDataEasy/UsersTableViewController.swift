//
//  UsersTableViewController.swift
//  CoreDataEasy
//
//  Created by Oleksandr on 23.12.2019.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit
import CoreData

class UsersTableViewController: UITableViewController {
    lazy var frc = { () -> NSFetchedResultsController<User> in
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        // Configure the request's entity, and optionally its predicate
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]

        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        controller.delegate = self
        return controller
    }()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        frc.sections!.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = self.frc.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let object = frc.object(at: indexPath)
        cell.textLabel?.text = object.name
        return cell
    }

}

extension UsersTableViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
        tabBarItem.badgeValue = "\(frc.fetchedObjects?.count ?? -1)"
    }
}
