//
//  FPTabBarViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit

class FPTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsController = FPSettingsViewController()
        settingsController.tabBarItem = UITabBarItem(title: "Settings",
                                                     image: UIImage(systemName: "tabBarSettingsIcon"),
                                                     tag: 0)

        let historyController = FPHistoryViewController()
        historyController.tabBarItem = UITabBarItem(title: "History",
                                                    image: UIImage(systemName: "Date"),
                                                    tag: 1)

        self.setViewControllers([
                                    UINavigationController(rootViewController: settingsController),
                                    UINavigationController(rootViewController: historyController)],
                                animated: true)

        self.setTabBarAppereance()
    }

    func setTabBarAppereance() {

        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .systemOrange
        self.tabBar.unselectedItemTintColor = .red

        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
    }

}
