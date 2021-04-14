//
//  FPSettingsViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit

class FPSettingsViewController: UIViewController {

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemRed, tintColor: .black, title: "Settings", preferredLargeTitle: true)
    }
}
