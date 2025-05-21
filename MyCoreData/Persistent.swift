//
//  Persistent.swift
//  MyCoreData
//
//  Created by Development on 2025/05/21.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MyCoreData")

        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
