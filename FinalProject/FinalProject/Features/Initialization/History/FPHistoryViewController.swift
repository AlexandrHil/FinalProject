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

        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemBlue, backgoundColor: .systemYellow, tintColor: .black, title: "History", preferredLargeTitle: true)

    }
}
