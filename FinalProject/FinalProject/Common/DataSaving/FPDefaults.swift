//
//  FPDefaults.swift
//  FinalProject
//
//  Created by Alex on 17.04.21.
//

import Foundation

class FPDefaults {
    static let sh = FPDefaults()

    private enum Keys {
        static let tasksToSave = "FPTasks"
    }

    var tasks: [FPTask] {
        get {
            self.loadTasks()
        }
        set(newTasks) {
            self.saveTasks(newTasks)
        }
    }

    private func saveTasks(_ tasksToSave: [FPTask]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(tasksToSave) {
            UserDefaults.standard.setValue(data, forKey: Keys.tasksToSave)
        }
    }

    private func loadTasks() -> [FPTask] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: Keys.tasksToSave),
           let tasksToSave = try? decoder.decode([FPTask].self, from: data) {
            return tasksToSave
        } else {
            return
                [
                    FPTask(taskTitle: " Tap + and add new task",
                           taskDescription: "")
            ]
        }
    }
}
