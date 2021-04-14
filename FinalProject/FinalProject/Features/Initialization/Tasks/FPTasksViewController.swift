//
//  FPTasksViewController.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit
import SnapKit

class FPTasksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        self.navigationItem.setRightBarButton(addButton, animated: false)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)
        self.navigationItem.rightBarButtonItem?.style = .done

        self.view.backgroundColor = UIColor(red: 253/255, green: 240/255, blue: 213/255, alpha: 1)

        let tapgest = UITapGestureRecognizer(target: self, action: #selector(taptoend))
        self.view.addGestureRecognizer(tapgest)

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemRed, tintColor: .black, title: " Today,  \(date)", preferredLargeTitle: true)

    }

    // MARK: - actions

    @objc func addButtonTapped() {
        let popUp = FPPopUpViewController()
        self.view.addSubview(popUp)
    }

    @objc func taptoend() {
        self.view.endEditing(true)
    }
}
