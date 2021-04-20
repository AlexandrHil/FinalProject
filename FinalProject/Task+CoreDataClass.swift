//
//  Task+CoreDataClass.swift
//  FinalProject
//
//  Created by Alex on 20.04.21.
//
//

import UIKit
import CoreData

@objc(Task)
public class Task: NSManagedObject {

    func set(_ task: FPTask) {
        self.taskTitle = task.taskTitle
        self.taskDescription = task.taskDescription
    }

    func getTask() -> FPTask {
        let task = FPTask(taskTitle: self.taskTitle, taskDescription: self.taskDescription)
        
        return task
    }
}
