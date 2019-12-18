//
//  ViewController.swift
//  CoreDataEasy
//
//  Created by Oleksandr on 17.12.2019.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let coreData = CoreDataStack.shared
    var user: User?
    var counter: Int = 0
    // MARK: - IBOutlets
    @IBOutlet private weak var userLabel: UILabel!

    @IBOutlet private weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IBActions
    @IBAction private func addUser(_ sender: Any) {
        user = User(context: coreData.persistentContainer.viewContext)

        user?.id = "123"
        user?.name = "New user"

        saveCoreData()

        userLabel.text = user?.name
    }

    @IBAction private func addDevice(_ sender: Any) {

        let device = Device(context: coreData.persistentContainer.viewContext)

        device.id = "123"
        counter += 1
        device.model = "Model \(counter)"

        saveCoreData()

        user?.addToDevices(device)

        saveCoreData()

        stackView.arrangedSubviews.forEach({$0.isHidden = true })
        user?.devicesArray.forEach { device in
            let label = UILabel(frame: .zero)
            label.text = device.model
            stackView.addArrangedSubview(label)
        }


    }

    @IBAction func deleteTap(_ sender: Any) {
        if let user = self.user {
            coreData.persistentContainer.viewContext.delete(user)
        }
    }

    private func saveCoreData() {
        do {
            try coreData.persistentContainer.viewContext.save()
        } catch {
            debugPrint(error)
        }
    }

}

