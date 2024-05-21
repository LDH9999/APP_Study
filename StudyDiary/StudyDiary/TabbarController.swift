//
//  TabbarController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/02.
//

import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.93, alpha: 1.00)
        
        tabBar.tintColor = .black
        
        tabBar.unselectedItemTintColor = .systemGray3
    }
}
