//
//  FPHistoryViewController.swift
//  FinalProject
//
//  Created by Alex on 14.04.21.
//

import UIKit
import FSCalendar

class FPHistoryViewController: UIViewController {

    fileprivate weak var calendar: FSCalendar?

    // MARK: - life cycle functions

    override func viewDidLoad() {
        super.viewDidLoad()

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
    }

    override func updateViewConstraints() {
        self.calendar?.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(330)
            make.bottom.equalToSuperview().inset(30)
        }
        super.updateViewConstraints()
    }
}
