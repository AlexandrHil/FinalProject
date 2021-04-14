//
//  FPInitViewController.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit
import SnapKit

class FPInitViewController: UIViewController {

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = " Today,  \(date)"
        label.backgroundColor = UIColor(red: 105/255, green: 155/255, blue: 188/255, alpha: 1)
        label.textColor = UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.setTabBar()

        self.title = "Dayly task"

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        self.navigationItem.setRightBarButton(addButton, animated: false)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)
        self.navigationItem.rightBarButtonItem?.style = .done

        self.view.backgroundColor = UIColor(red: 253/255, green: 240/255, blue: 213/255, alpha: 1)

        self.view.addSubview(dateLabel)

        let tapgest = UITapGestureRecognizer(target: self, action: #selector(taptoend))
        self.view.addGestureRecognizer(tapgest)

        self.updateConstraints()
    }

    // MARK: - actions

    func updateConstraints() {
        self.dateLabel.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(88)
            make.height.equalTo(88)
        }
    }

    func setTabBar() {

        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(FPTabBarViewController())
        }
    }

    @objc func addButtonTapped() {

// blur - эффект?
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        blurredView.frame = self.view.bounds
        blurredView.alpha = 0.8
        self.view.addSubview(blurredView)

        let popUp = FPPopUpViewController()
        self.view.addSubview(popUp)
    }

    @objc func taptoend() {
        self.view.endEditing(true)
    }
}
