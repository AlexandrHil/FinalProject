//
//  Task+CoreDataClass.swift
//  FinalProject
//
//  Created by Alex on 20.04.21.
//

import UIKit
import CoreData

@objc(Task)
public class Task: NSManagedObject {

    func set(_ task: FPTask) {
        self.taskTitle = task.taskTitle
        self.taskDescription = task.taskDescription
        self.taskDate = task.taskDate
        self.taskChecked = task.taskChecked
    }

    func getTask() -> FPTask {
        let task = FPTask(taskTitle: self.taskTitle, taskDescription: self.taskDescription, taskDate: self.taskDate, taskChecked: self.taskChecked)

        return task
    }
}
