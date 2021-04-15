//
//  FPPopUpViewController.swift
//  FinalProject
//
//  Created by Alex on 11.04.21.
//

import UIKit
import SnapKit

class FPPopUpViewController: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
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
        tv.backgroundColor = .systemYellow
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

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.9)

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

    @objc private func cancelButtonTapped() {
        self.backgroundColor = UIColor.white

        UIView.animate(withDuration: 0.5) {
            self.container.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.textView.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.okButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            self.cancelButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
        }
    }

    @objc private func okButtonTapped() {
        self.backgroundColor = UIColor.white

        UIView.animate(withDuration: 0.5) {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.textView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.okButton.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.cancelButton.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        }
    }
}
