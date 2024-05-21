//
//  SecondViewController.swift
//  Nav&Tab
//
//  Created by 임동현 on 2024/04/30.
//

import UIKit

@available(iOS 16.0, *)
class SecondViewController: UITabBarController {
    lazy var calendarView: UICalendarView = {
        let view = UICalendarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        // 달력 커스텀을 위해 설정해 주어야 하는 속성
        view.wantsDateDecorations = true
        
        return view
    }()
    
    //    private let dateLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "5월 7일 App Study 3주차"
    //        label.font = UIFont.systemFont(ofSize: 22)
    //        label.textColor = .red
    //        return label
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyConstraints()
    }
    
    fileprivate func applyConstraints() {
        view.addSubview(calendarView)
        
        let calendarViewConstraints = [
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
        ]
        
        NSLayoutConstraint.activate(calendarViewConstraints)
        view.backgroundColor = .white
        
        //        view.addSubview(dateLabel)
        //
        //        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        //        dateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        //        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        //        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        //        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //        }
        
    }
}
