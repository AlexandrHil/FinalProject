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
        settingsController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .more,
            tag: 0)

        let historyController = FPHistoryViewController()
        historyController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .contacts,
            tag: 1)
        
        self.setViewControllers([
                                    UINavigationController(rootViewController: settingsController),
                                    UINavigationController(rootViewController: historyController)],
                                animated: true)

        self.setTabBarAppereance()
    }

    func setTabBarAppereance() {

        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .systemGray

        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
    }

}
