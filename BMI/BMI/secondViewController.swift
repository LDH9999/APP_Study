//
//  secondViewController.swift
//  BMI
//
//  Created by 임동현 on 2024/04/25.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviseLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var bmiNumber: Double?
    var adviseString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.backgroundColor = .gray
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        
        guard let bmi = bmiNumber else { return }
        bmiNumberLabel.text = String(bmi)
        adviseLabel.text = adviseString
        bmiNumberLabel.backgroundColor = bmiColor
        
        backButton.setTitle("다시 계산하기", for: .normal)
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
