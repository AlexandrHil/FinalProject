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

        self.view.backgroundColor = .systemGreen

        configureNavigationBar(largeTitleColor: .systemBlue, backgoundColor: .systemYellow, tintColor: .black, title: "History", preferredLargeTitle: true)

    }
}
