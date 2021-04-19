//
//  FPSettingsViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit

class FPSettingsViewController: UIViewController {

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemRed, tintColor: .black, title: "Settings", preferredLargeTitle: true)
    }
}
