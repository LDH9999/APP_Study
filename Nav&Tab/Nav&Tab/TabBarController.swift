//
//  TabBarController.swift
//  Nav&Tab
//
//  Created by 임동현 on 2024/04/30.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            // 선택된 탭바 아이템의 인덱스 구하기
            if let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) {
                if selectedIndex == 1 {
                    
                }
        }
    }
}
