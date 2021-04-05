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
        label.text = "  Today,  \(date)"
        label.backgroundColor = UIColor(red: 105/255, green: 155/255, blue: 188/255, alpha: 1)
        label.textColor = UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Dayly event"

        let addButton = UIBarButtonItem(systemItem: .add)
        self.navigationItem.setRightBarButton(addButton, animated: false)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0/255, green: 48/255, blue: 73/255, alpha: 1)
        self.navigationItem.rightBarButtonItem?.style = .done

        self.view.backgroundColor = UIColor(red: 253/255, green: 240/255, blue: 213/255, alpha: 1)

        self.view.addSubview(dateLabel)

        self.updateConstraints()
    }

    func updateConstraints() {
        self.dateLabel.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(88)
            make.height.equalTo(88)

        }
    }
}
