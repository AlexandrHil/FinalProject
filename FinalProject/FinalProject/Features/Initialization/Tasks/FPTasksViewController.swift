//
//  FPTasksViewController.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit

class FPTasksViewController: UITableViewController, FPPopUpViewControllerDelegate {

    let date = String(DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .long, timeStyle: .none))

    private var tasks: [FPTask] = FPDB.sh.loadTasks()

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        self.navigationItem.setRightBarButton(addButton, animated: false)
        self.navigationItem.rightBarButtonItem?.tintColor = .systemYellow
        self.navigationItem.rightBarButtonItem?.style = .done
        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemBlue, tintColor: .black, title: " Today,  \(date)", preferredLargeTitle: true)

        self.tableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: FPTasksCell.reuseIdentifier)

        self.tableView.isScrollEnabled = true
    }

    // MARK: - actions

    func FPPopUpViewControllerOkButtonTapped(_ controller: FPPopUpViewController, didFinishAdding newTask: FPTask) {
        let newRowIndex = tasks.count
        self.tasks.append(newTask)

        let indexPath = IndexPath(row: newRowIndex, section: 0)

        tableView.insertRows(at: [indexPath], with: .automatic)
        FPDB.sh.save(task: newTask)
    }

    @objc func addButtonTapped() {
        let popUp = FPPopUpViewController()
        popUp.delegate = self

        self.view.addSubview(popUp)

        self.view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.8)
    }

    // MARK: - table view

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            FPDB.sh.delete([tasks[indexPath.row]])
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FPTasksCell.reuseIdentifier,
                                                 for: indexPath) as? FPTasksCell ?? FPTasksCell()

        let task = tasks[indexPath.row]

        cell.setCellData(taskName: "  \(task.taskTitle)", taskDescription: "  from \(date.lowercased())")

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = .systemGreen
        }
    }
}
