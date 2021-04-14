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

        let tasksController = FPTasksViewController()
        tasksController.tabBarItem = UITabBarItem(title: "Events", image: UIImage(systemName: "rectangle.stack.fill.badge.plus"), tag: 0)

        let historyController = FPHistoryViewController()
        historyController.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "calendar.badge.clock"), tag: 1)

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
