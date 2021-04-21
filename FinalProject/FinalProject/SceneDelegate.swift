//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let scene = FPTabBarViewController()
        self.window?.rootViewController = scene
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene

        self.setUpNavbarAppereance()
    }

    func setUpNavbarAppereance() {
        let navBarAppereance = UINavigationBarAppearance()
        navBarAppereance.backgroundColor = UIColor(red: 105/255, green: 155/255, blue: 188/255, alpha: 1)
        navBarAppereance.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navBarAppereance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 20)]
        navBarAppereance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)]

        let buttonStyle = UIBarButtonItemAppearance(style: .plain)
        buttonStyle.normal.titleTextAttributes = [.foregroundColor: UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)]
        navBarAppereance.buttonAppearance = buttonStyle
    }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }

        window.rootViewController = vc
        if animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionFlipFromLeft,
                              animations: nil)
        }
    }
}
