//
//  FPTabBarViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit

class FPTabBarViewController: UITabBarController {

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

        let tasksController = FPTasksViewController()
        tasksController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(systemName: "text.badge.plus"), tag: 0)

        let historyController = FPHistoryViewController()
        historyController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "calendar"), tag: 1)

        let settingsController = FPSettingsViewController()
        settingsController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 2)

        self.setViewControllers([
                                    UINavigationController(rootViewController: tasksController),
                                    UINavigationController(rootViewController: historyController),
                                    UINavigationController(rootViewController: settingsController)],
                                animated: true)

        self.setTabBarAppereance()
    }

    func setTabBarAppereance() {

        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)

        self.tabBar.barTintColor = UIColor(hexString: "#BDD5EA")
        self.tabBar.tintColor = .systemRed
        self.tabBar.unselectedItemTintColor = UIColor(hexString: "#495867")
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = self.tabBar.items?.firstIndex(of: item),
              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else { return }
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut) {

            imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

            UIView.animate(withDuration: 0.5,
                           delay: 0.2,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut) {
                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}
