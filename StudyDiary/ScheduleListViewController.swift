//
//  ScheduleListViewController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/06.
//

import UIKit

class ScheduleListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView?.dataSource = self
    }
    
    func transDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from:date)
        return dateString
    }
    
    func reloadTable() {
        tableView?.reloadData()
    }
    
    func dataSort() {
        scheduleData.sampleData.sort { $0.scheduleDate < $1.scheduleDate }
    }
    

}

extension ScheduleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return scheduleData.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schedule = scheduleData.sampleData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell", for: indexPath) as! SchListTableViewCell
        cell.scheduleTitle.text = schedule.scheduleTitle
        cell.scheduleDate.text = transDateToString(date: schedule.scheduleDate)
        cell.selectionStyle = .none
        return cell
    }
}
