//
//  Calendar+Ex.swift
//  FinalProject
//
//  Created by Alex on 17.04.21.
//

import Foundation
import FSCalendar

extension FPHistoryViewController: FSCalendarDelegate, FSCalendarDataSource {
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        return "Tasks statistics"
//    }
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return ""
//    }
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "CELL", for: date, at: position)

        return cell
    }
}
