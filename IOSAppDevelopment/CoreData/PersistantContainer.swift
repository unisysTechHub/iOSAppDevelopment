//
//  PersistantContainer.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 13/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import CoreData

class PersistentContainer: NSPersistentContainer {

    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        print("save changes")
        guard context.hasChanges else { return }
        do {
            try context.save()
            
            print("save changes")
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}

