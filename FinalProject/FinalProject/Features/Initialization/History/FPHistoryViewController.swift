//
//  FPHistoryViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit
import FSCalendar

class FPHistoryViewController: UIViewController {

    var tasks: [FPTask] = [FPTask(title: "qqqqqq", description: "wwwwww"),
                           FPTask(title: "aaaaaa", description: "sssss"),
                           FPTask(title: "zzzzz", description: "xxxxxxx")]

    // MARK: - gui variables

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FPTasksCell.self,
                  forCellReuseIdentifier: FPTasksCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
      }()

    fileprivate weak var calendar: FSCalendar?

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)

        self.view.backgroundColor = UIColor(hexString: "#F7F7FF")

        configureNavigationBar(largeTitleColor: .systemBlue, backgoundColor: .systemYellow, tintColor: .black, title: "History", preferredLargeTitle: true)

        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)

        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 28)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 22)
        calendar.appearance.todayColor = .systemRed
        calendar.appearance.titleDefaultColor = UIColor(hexString: "#495867")
        calendar.appearance.titleSelectionColor = UIColor(hexString: "#495867")
        calendar.appearance.selectionColor = .clear

        self.calendar = calendar

        self.calendar?.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(330)
            make.bottom.equalToSuperview().inset(30)
        }

        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
    }

    // MARK: - set up constraints

//    override func updateViewConstraints() {
//        self.calendar?.snp.updateConstraints { (make) in
//            make.left.right.equalToSuperview().inset(10)
//            make.top.equalToSuperview().offset(330)
//            make.bottom.equalToSuperview().inset(30)
//        }
//
//        self.tableView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().inset(10)
//            make.height.equalTo(300)
//        }
//        super.updateViewConstraints()
//    }
}

extension FPHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FPTasksCell.reuseIdentifier,
                                                 for: indexPath)
        if let cell = cell as? FPTasksCell {
            cell.setCell(model: self.tasks[indexPath.row])
        }
        return cell
    }
}
