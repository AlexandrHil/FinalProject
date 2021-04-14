//
//  FPHistoryViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit

class FPHistoryViewController: UIViewController {

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "History"
        navigationController?.navigationBar.backgroundColor = .brown
    }

}
