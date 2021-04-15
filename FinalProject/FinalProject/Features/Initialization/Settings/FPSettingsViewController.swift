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

        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemBlue, tintColor: .black, title: "Settings", preferredLargeTitle: true)
    }
}
