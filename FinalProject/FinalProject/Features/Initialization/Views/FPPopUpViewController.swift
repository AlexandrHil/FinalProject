//
//  FPPopUpViewController.swift
//  FinalProject
//
//  Created by Alex on 11.04.21.
//

import UIKit
import SnapKit

protocol FPPopUpViewControllerDelegate: class {
    func FPPopUpViewControllerOkButtonTapped(_ controller: FPPopUpViewController, didFinishAdding newTask: FPTask)
}

class FPPopUpViewController: UIView {

    weak var delegate: FPPopUpViewControllerDelegate?

    let date = String(DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .long, timeStyle: .none))

    // MARK: - gui variables

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.text = "New task"
        label.backgroundColor = .systemRed
        label.textColor = .systemYellow
        label.layer.cornerRadius = 20
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        return label
    }()

    private var textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.clipsToBounds = true
        tv.backgroundColor = UIColor(hexString: "#F7F7FF")
        tv.textColor = .systemBlue
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.tintColor = .systemBlue
        tv.textAlignment = .left
        return tv
    }()

    private var container: UIView = {
        let popUpView = UIView()
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.layer.cornerRadius = 20

        return popUpView
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, textView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical

        return stack
    }()

    private var cancelButton: UIButton = {
        let cancel = UIButton()
        cancel.backgroundColor = .systemYellow
        cancel.setTitleColor(.systemRed, for: UIControl.State())
        cancel.setTitle("Cancel", for: UIControl.State())
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cancel.clipsToBounds = true
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.layer.cornerRadius = 20
        cancel.layer.maskedCorners = [.layerMinXMaxYCorner]
        cancel.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

        return cancel
    }()

    private var okButton: UIButton = {
        let ok = UIButton()
        ok.backgroundColor = .systemYellow
        ok.setTitleColor(.systemBlue, for: UIControl.State())
        ok.setTitle("OK", for: UIControl.State())
        ok.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        ok.clipsToBounds = true
        ok.translatesAutoresizingMaskIntoConstraints = false
        ok.layer.cornerRadius = 20
        ok.layer.maskedCorners = [.layerMaxXMaxYCorner]
        ok.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)

        return ok
    }()

    // MARK: - initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.7)

        self.frame = UIScreen.main.bounds

        self.addSubview(container)

        self.container.addSubview(stack)

        self.addSubview(titleLabel)
        self.addSubview(textView)

        self.addSubview(okButton)
        self.addSubview(cancelButton)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - set up constraints

    override func updateConstraints() {
        self.container.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(180)
            make.height.equalTo(200)
        }

        self.stack.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(180)
            make.height.equalTo(200)
        }

        self.titleLabel.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(180)
            make.height.equalTo(50)
        }

        self.textView.snp.updateConstraints { (make) in
            make.left.right.equalTo(container)
            make.top.equalTo(container).inset(50)
            make.height.equalTo(container).inset(50)
        }

        self.cancelButton.snp.updateConstraints { (make) in
            make.left.equalTo(container)
            make.right.equalTo(container.snp_centerXWithinMargins)
            make.top.equalTo(container).inset(150)
            make.bottom.equalTo(container)
        }

        self.okButton.snp.updateConstraints { (make) in
            make.right.equalTo(container)
            make.left.equalTo(container.snp_centerXWithinMargins)
            make.top.equalTo(container).inset(150)
            make.bottom.equalTo(container)
        }
        super.updateConstraints()
    }

    // MARK: - actions

    @objc private func cancelButtonTapped() {

        UIView.animate(withDuration: 0.5) {
            self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.textView.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.okButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.cancelButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        }
        self.backgroundColor = .clear
    }

    @objc private func okButtonTapped() {

        UIView.animate(withDuration: 0.5) {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.textView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.okButton.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.cancelButton.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        }
        self.backgroundColor = .clear

        let taskTitle = FPTask(taskTitle: textView.text, taskDescription: "  from \(date.lowercased())", taskDate: Date(), taskChecked: true)

        delegate?.FPPopUpViewControllerOkButtonTapped(self, didFinishAdding: taskTitle)
    }
}
