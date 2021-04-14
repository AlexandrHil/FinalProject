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
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 0)

        let historyController = FPHistoryViewController()
        historyController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "calendar.badge.clock"), tag: 1)

        self.setViewControllers([
                                    UINavigationController(rootViewController: settingsController),
                                    UINavigationController(rootViewController: historyController)],
                                animated: true)

        self.setTabBarAppereance()
    }

    func setTabBarAppereance() {

        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)

        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .systemGray

        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
    }
}
