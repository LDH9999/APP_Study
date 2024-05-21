//
//  MyProfileViewController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/05.
//

import UIKit

class MyProfileViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var mbtiLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.backgroundColor = UIColor(red: 0.79, green: 0.87, blue: 0.89, alpha: 1.00)
        imageView.layer.cornerRadius = 55
    }
    
    func defaultDataSetting() {
        nameLabel?.text = "Eren(임동현)"
        commentLabel?.text = "자유를 추구하는 Eren입니다."
        ageLabel?.text = "26"
        mbtiLabel?.text = "INTP"
        favoriteLabel?.text = "게임"
        hobbyLabel?.text = "멍 때리기"
    }
    
    func dataSetting(index: Int) {
        let profile = ProfileDataSet.sampleData[index]
        nameLabel?.text = profile.nicName + "(\(profile.name))"
        commentLabel?.text = profile.comment
        ageLabel?.text = profile.age
        mbtiLabel?.text = profile.mbti
        favoriteLabel?.text = profile.favorite
        hobbyLabel?.text = profile.hobby
    }
}
