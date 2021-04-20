//
//  Task+CoreDataProperties.swift
//  FinalProject
//
//  Created by Alex on 20.04.21.
//

import Foundation
import CoreData

extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var taskTitle: String
    @NSManaged public var taskDescription: String
}

extension Task: Identifiable {
}
