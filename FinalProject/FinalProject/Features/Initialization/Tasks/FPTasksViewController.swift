//
//  FPTasksViewController.swift
//  FinalProject
//
//  Created by Alex on 31.03.21.
//

import UIKit

class FPTasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FPPopUpViewControllerDelegate {

    let date = String(DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .long, timeStyle: .none))

    private var tasks: [FPTask] = FPDB.sh.loadTasks()

    // MARK: - gui variables

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FPTasksCell.self,
                  forCellReuseIdentifier: FPTasksCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true

        return tableView
      }()

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        self.navigationItem.setRightBarButton(addButton, animated: false)
        self.navigationItem.rightBarButtonItem?.tintColor = .systemYellow
        self.navigationItem.rightBarButtonItem?.style = .done
        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemYellow, backgoundColor: .systemBlue, tintColor: .black, title: " Today,  \(date)", preferredLargeTitle: true)

        self.tableView.register(FPTasksCell.self,
                                forCellReuseIdentifier: FPTasksCell.reuseIdentifier)

        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - actions

    func FPPopUpViewControllerOkButtonTapped(_ controller: FPPopUpViewController, didFinishAdding newTask: FPTask) {
        let newRowIndex = tasks.count
        self.tasks.append(newTask)

        let indexPath = IndexPath(row: newRowIndex, section: 0)

        tableView.insertRows(at: [indexPath], with: .automatic)
        navigationController?.popViewController(animated: true)
        FPDB.sh.save(task: newTask)
    }

    @objc func addButtonTapped() {
        let popUp = FPPopUpViewController()
        popUp.delegate = self

        self.view.addSubview(popUp)

        self.view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.8)
    }

    // MARK: - table view

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FPTasksCell.reuseIdentifier,
                                                 for: indexPath) as? FPTasksCell ?? FPTasksCell()

        let task = tasks[indexPath.row]

        cell.setCellData(taskName: "  \(task.taskTitle)", taskDescription: "  from \(date.lowercased())")

        return cell
    }
}
