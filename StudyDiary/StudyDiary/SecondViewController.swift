//
//  SecondViewController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/05.
//

import UIKit
import FSCalendar

struct scheduleData {
    let scheduleDate: Date
    let scheduleTitle: String
    let scheduleNote: String
    
    static func transStringToDate(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: string)
        return date!
    }
}

class SecondViewController: UIViewController {
    @IBOutlet weak var calendar: FSCalendar!
    private let calAddVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalendarAddViewController") as! CalendarAddViewController
    private let scheduleListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScheduleListViewController") as! ScheduleListViewController
    private var array = [Date]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        calAddVC.delegate = self
        scheduleListVC.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.scope = .month
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.titleDefaultColor = .black  // 평일
        calendar.appearance.titleWeekendColor = .red
        calendar.appearance.selectionColor = .clear
        calendar.appearance.todayColor = UIColor(red: 0.77, green: 0.91, blue: 0.96, alpha: 1.00)
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.eventDefaultColor = .green
        calendar.appearance.eventSelectionColor = .green
        
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain,  target: self, action: #selector(rightButtonTapped))
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.clock"), style: .plain,  target: self, action: #selector(leftButtonTapped))
        
        rightButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightButton
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButton
        
        for i in 0..<scheduleData.sampleData.count {
            array.append(scheduleData.sampleData[i].scheduleDate)
        }
        

    }
    
    @objc func rightButtonTapped() {
            self.navigationController?.pushViewController(calAddVC, animated: true)
        }
    
    @objc func leftButtonTapped() {
            self.navigationController?.pushViewController(scheduleListVC, animated: true)
        }
}

extension SecondViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return .black
        }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if array.contains(date){
            return 1
        } else {
            return 0
        }
        }
}

extension scheduleData {
    static var sampleData: [scheduleData] = [
        scheduleData(scheduleDate: transStringToDate(string: "2024-05-07"), scheduleTitle: "앱 스터디 3주차", scheduleNote: "노션에 게시된 주제의 앱을 각자 개발 발표"), scheduleData(scheduleDate: transStringToDate(string: "2024-05-14"), scheduleTitle: "앱 스터디 4주차", scheduleNote: "노션에 게시된 주제의 앱을 각자 개발 발표"), scheduleData(scheduleDate: transStringToDate(string: "2024-05-21"), scheduleTitle: "앱 스터디 5주차", scheduleNote: "노션에 게시된 주제의 앱을 각자 개발 발표"), scheduleData(scheduleDate: transStringToDate(string: "2024-05-28"), scheduleTitle: "앱 스터디 6주차", scheduleNote: "노션에 게시된 주제의 앱을 각자 개발 발표")
    ]
}

extension SecondViewController: CalVcProtocol {
    func arrayPlus(string: String) {
        let date = scheduleData.transStringToDate(string: string)
        array.append(date)
        calendar.reloadData()
    }
    
    func reloadTable() {
        scheduleListVC.reloadTable()
        scheduleListVC.dataSort()
    }
}




