//
//  FPDatabase.swift
//  FinalProject
//
//  Created by Alex on 20.04.21.
//

import Foundation
import CoreData

typealias FPDB = FPDatabase

class FPDatabase {
    static let sh = FPDatabase()

    // MARK: - properties

    private static let databaseContainerName = "FPDataModel"

    // MARK: - core data

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: FPDB.databaseContainerName)
        container.loadPersistentStores { (description, error) in
            if let error = error {
                Swift.debugPrint(error.localizedDescription)
            }
            Swift.debugPrint("Store description: \(description)")
        }
        return container
    }()

    private var context: NSManagedObjectContext {
        self.persistentContainer.viewContext
    }

    // MARK: - core data functions

    func saveContext() {
        if self.context.hasChanges {
            Swift.debugPrint("Context inerted objects: \(self.context.insertedObjects)")
            Swift.debugPrint("Context deleted objects: \(self.context.deletedObjects)")

            do {
                try self.context.save()
                Swift.debugPrint("Context was saved")
            } catch {
                let nsError = error as NSError
                Swift.debugPrint("couldn't save data. reason: \(nsError.localizedDescription) \(nsError.userInfo))")
            }
        }
    }

    func save(task: FPTask) {
        let coreDataTask = Task(context: self.context)
        coreDataTask.set(task)
        self.saveContext()
    }

    func loadTasks() -> [FPTask] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()

        do {
            let tasks = try self.context.fetch(fetchRequest)
            print("SMTH")

            return tasks.map { $0.getTask() }
        } catch {
            Swift.debugPrint(error.localizedDescription)
            return []
        }
    }

    func delete(_ tasks: [FPTask]) {
        tasks.forEach { task in
            self.getCoreDataObject(from: task)
        }

        self.saveContext()
    }

    @discardableResult
    private func getCoreDataObject(from task: FPTask) -> Task {
        let coreDataTask = Task(context: self.context)
        coreDataTask.set(task)

        return coreDataTask
    }
}
