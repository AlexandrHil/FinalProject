//
//  FPTask.swift
//  FinalProject
//
//  Created by Alex on 18.04.21.
//

import UIKit

class FPTask: Decodable {
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
    var taskChecked: Bool

    enum CodingKeys: String, CodingKey {
        case taskTitle
        case taskDescription
        case taskDate
        case taskChecked
    }

    // MARK: - initializators

    init(taskTitle: String, taskDescription: String, taskDate: Date, taskChecked: Bool) {
        self.taskTitle = taskTitle
        self.taskDescription = taskDescription
        self.taskDate = taskDate
        self.taskChecked = taskChecked
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.taskTitle = try container.decode(String.self, forKey: .taskTitle)
        self.taskDescription = try container.decode(String.self, forKey: .taskDescription)
        self.taskDate  = try container.decode(Date.self, forKey: .taskDate)
        self.taskChecked = try container.decode(Bool.self, forKey: .taskChecked)
    }
}
