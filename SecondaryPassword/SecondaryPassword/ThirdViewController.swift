//
//  ThirdViewController.swift
//  SecondaryPassword
//
//  Created by 임동현 on 2024/04/29.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - Property Code
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "서비스 접속 성공"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var centerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 0.86, green: 0.88, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = true
        button.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - View Setting Code
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupAutoLayout()
    }
    
    func configure() {
        self.view.backgroundColor = UIColor(red: 0.88, green: 0.94, blue: 0.94, alpha: 1.00)
        view.addSubview(centerButton)
        view.addSubview(topLabel)
    }
    
    func setupAutoLayout() {
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        centerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.bottomAnchor.constraint(equalTo: centerButton.topAnchor, constant: -80).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        
    }
    
    //MARK: - Func Code
    func createAlert() {
        let alert = UIAlertController(title: "알림", message: "알림창입니다. 확인버튼을 눌러보세요.", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default){ action in
            self.topLabel.text = "확인 버튼이 눌림"
                }
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(sucess)
        alert.addAction(cancle)
        
        present(alert, animated: true)
    }
    
    @objc func centerButtonTapped() {
        createAlert()
    }

}
