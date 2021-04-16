//
//  FPTasksCell.swift
//  FinalProject
//
//  Created by Alex on 16.04.21.
//

import UIKit

class FPTasksCell: UITableViewCell {

    static let reuseIdentifier: String = "FPTasksCell"

    // MARK: - gui variables

    private lazy var taskContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false

        return view
    }()

    private lazy var taskName: UILabel = {
        let task = UILabel()
        task.translatesAutoresizingMaskIntoConstraints = false
        task.layer.cornerRadius = 15
        task.font = UIFont.boldSystemFont(ofSize: 25)
        task.numberOfLines = 1
        task.textColor = .systemBlue

        return task
    }()

    private lazy var taskDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 1
        description.tintColor = .black

        return description
        }()

    // MARK: - initializations

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.contentView.addSubview(self.taskContainerView)
        self.taskContainerView.addSubview(self.taskName)
        self.taskContainerView.addSubview(self.taskDescription)
    }

    func setCellData(taskName: String, taskDescription: String) {
        self.taskName.text = taskName
        self.taskDescription.text = taskDescription

        self.setNeedsUpdateConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.contentView.backgroundColor = .systemYellow

        self.taskContainerView.backgroundColor = isSelected ? UIColor(hexString: "#BDD5EA") : .white
    }

    // MARK: - set up constraints

    override func updateConstraints() {
        self.taskContainerView.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(5)
        }

        self.taskName.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(66)
        }

        self.taskDescription.snp.updateConstraints { (make) in
            make.top.equalTo(self.taskName.snp.bottom)
            make.height.equalTo(43)
            make.left.right.bottom.equalToSuperview().inset(10)
        }
        super.updateConstraints()
    }

    // MARK: - actions

    }
