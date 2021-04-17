//
//  FPTasksViewController.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit

class FPTasksViewController: UITableViewController, FPPopUpViewControllerDelegate {

    let date = String(DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .long, timeStyle: .none))

    var tasks = [FPTaskInfo]()

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        self.navigationItem.setRightBarButton(addButton, animated: false)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(hexString: "#495867")
        self.navigationItem.rightBarButtonItem?.style = .done

        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemRed, tintColor: .black, title: " Today,  \(date)", preferredLargeTitle: true)

        self.tableView.register(FPTasksCell.self,
                                forCellReuseIdentifier: FPTasksCell.reuseIdentifier)

        self.tableView.separatorStyle = .none

    }

    // MARK: - actions

    @objc func addButtonTapped() {
        let popUp = FPPopUpViewController()
        popUp.delegate = self

        self.view.addSubview(popUp)
        self.view.becomeFirstResponder()

        self.view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.8)
    }

    // MARK: - table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FPTasksCell.reuseIdentifier,
                                                 for: indexPath) as? FPTasksCell ?? FPTasksCell()

        let task = tasks[indexPath.row]

        cell.setCellData(taskName: task.taskTitle, taskDescription: "  from \(date.lowercased())")

        return cell
    }

    func FPPopUpViewControllerOkButtonTapped(_ controller: FPPopUpViewController, didFinishAdding newTask: FPTaskInfo) {
        let newRowIndex = tasks.count
        tasks.append(newTask)

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]

        tableView.insertRows(at: indexPaths, with: .automatic)
//        navigationController?.popViewController(animated: true)
    }

}
