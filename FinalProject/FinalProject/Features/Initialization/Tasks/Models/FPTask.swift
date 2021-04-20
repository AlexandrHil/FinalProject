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

    enum CodingKeys: String, CodingKey {
        case taskTitle
        case taskDescription
    }

    // MARK: - initializators

    init(taskTitle: String, taskDescription: String) {
        self.taskTitle = taskTitle
        self.taskDescription = taskDescription
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.taskTitle = try container.decode(String.self, forKey: .taskTitle)
        self.taskDescription = try container.decode(String.self, forKey: .taskDescription)
    }
}
