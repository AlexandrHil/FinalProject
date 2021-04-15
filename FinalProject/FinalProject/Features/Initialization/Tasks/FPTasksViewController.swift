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
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(hexString: "#495867")
        self.navigationItem.rightBarButtonItem?.style = .done

        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        let tapgest = UITapGestureRecognizer(target: self, action: #selector(taptoend))
        self.view.addGestureRecognizer(tapgest)

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemRed, tintColor: .black, title: " Today,  \(date)", preferredLargeTitle: true)

    }

    // MARK: - actions

    @objc func addButtonTapped() {
        let popUp = FPPopUpViewController()
        self.view.addSubview(popUp)

        self.view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.9)
    }

    @objc func taptoend() {
        self.view.endEditing(true)
    }
}
