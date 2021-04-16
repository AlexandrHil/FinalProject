//
//  FPTasksViewController.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit

class FPTasksViewController: UITableViewController {

    private let tasks: [String] = [
        "   Task1", "  Task2", "  Task3", "  New task", "  New task"
    ]

    // MARK: - life cycle functions

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

        self.tableView.register(FPTasksCell.self,
                                forCellReuseIdentifier: FPTasksCell.reuseIdentifier)

//        self.tableView.isScrollEnabled = false

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

    // MARK: - table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FPTasksCell.reuseIdentifier,
                                                 for: indexPath) as? FPTasksCell ?? FPTasksCell()

        cell.setCellData(taskName: self.tasks[indexPath.row],
                         taskDescription: "   From: task date")
        cell.backgroundColor = .systemYellow

        return cell
    }
}
