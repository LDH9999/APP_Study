//
//  ViewController.swift
//  SecondaryPassword
//
//  Created by 임동현 on 2024/04/26.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Property code
    private let id = "Allen4548"
    private let pw = "Eren4548"
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let pwLabel: UILabel = {
        let label = UILabel()
        label.text = "PW"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.91, alpha: 1.00)
        tf.textColor = .black
        tf.tintColor = .black
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.placeholder = "ID를 입력해주세요"
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    private lazy var pwTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.91, alpha: 1.00)
        tf.textColor = .black
        tf.tintColor = .black
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.isSecureTextEntry = true
        tf.placeholder = "PW를 입력해주세요"
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .red
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 0.86, green: 0.88, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var idStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idLabel, idTextField])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var pwStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [pwLabel, pwTextField])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idStackView, pwStackView, errorLabel])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - View Setting code
    private func configure() {
        self.view.backgroundColor = UIColor(red: 0.88, green: 0.94, blue: 0.94, alpha: 1.00)
        view.addSubview(loginStackView)
        view.addSubview(errorLabel)
        view.addSubview(loginButton)
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        pwLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 20).isActive = true
        errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 120).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //MARK: - login code
    @objc func loginButtonTapped() {
        if loginPossible() == true {
            let secondVC = SecondViewController()
            self.present(secondVC, animated: true, completion: nil)
        }
    }
    
    // id와 pw가 맞는지, 빈칸은 없는지 확인하는 함수
    func loginPossible() -> Bool {
        if !(idTextField.text == "") && !(pwTextField.text == "") {
            if idTextField.text == id {
                switch (pwTextField.text == pw) {
                case true:
                    idTextField.text = ""
                    pwTextField.text = ""
                    errorLabel.text = ""
                    return true
                case false:
                    errorLabel.text = "PW가 일치하지 않습니다."
                    return false
                }
            } else {
                errorLabel.text = "ID가 일치하지 않습니다"
                return false
            }
        } else {
            errorLabel.text = "ID나 PW를 입력해주세요"
            return false
        }
    }
}


