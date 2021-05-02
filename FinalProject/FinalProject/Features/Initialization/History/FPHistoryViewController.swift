//
//  FPHistoryViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit
import CoreData
import FSCalendar

class FPHistoryViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    private var tasks: [FPTask] = FPDB.sh.loadTasks()

    // MARK: - gui variables

    var datesWithEvent = ["2021-04-19"]
    var datesWithMultipleEvents = ["2021-04-19"]

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

    fileprivate lazy var calendarDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()

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
        calendar.firstWeekday = 2

        self.calendar = calendar

        self.calendar?.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(310)
            make.bottom.equalToSuperview().inset(30)
        }

        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        tasks = FPDB.sh.loadTasks()
        tableView.reloadData()
    }

    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.calendarDateFormatter.string(from: date)
        if self.datesWithEvent.contains(dateString) {
            return 1
        }
        return 0
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        let dateString = self.calendarDateFormatter.string(from: date)
        if self.datesWithEvent.contains(dateString) {
            return .red
        }
        return appearance.selectionColor
    }
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let task = tasks[indexPath.row]

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: task.taskDate)

        datesWithEvent = [dateString]
        calendar?.reloadData()
        tableView.reloadData()
    }
}
