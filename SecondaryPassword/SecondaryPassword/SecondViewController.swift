//
//  SecondViewController.swift
//  SecondaryPassword
//
//  Created by 임동현 on 2024/04/27.
//

import UIKit

class SecondViewController: UIViewController, CustomKeyboardProtocol, CustomKeyboard2Protocol {
    
    //MARK: - Property code
    private var systemPasswordAry = ["1", "2", "3", "4", "D"]
    private var userPasswordAry = ["?", "?", "?", "?", "?"]
    private var inputCount = 0
    private var correctPassword = true
    private var tryCount = 0
    
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 눌러주세요"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0.32, green: 0.34, blue: 0.37, alpha: 1.00)
        label.textColor = .white
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "숫자 4자리 + 영문자 1자리"
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 0.32, green: 0.34, blue: 0.37, alpha: 1.00)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [topLabel, bottomLabel])
        stview.spacing = 15
        stview.axis = .vertical
        stview.alignment = .fill
        return stview
    }()
    
    private lazy var passwordTextFieldView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var passwordTextFieldView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var passwordTextFieldView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var passwordTextFieldView4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var plusView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.32, green: 0.34, blue: 0.37, alpha: 1.00)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var passwordTextFieldView5: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        view.clipsToBounds = true
        return view
    }()
    
    lazy var viewArry = [passwordTextFieldView1, passwordTextFieldView2, passwordTextFieldView3, passwordTextFieldView4, plusView, passwordTextFieldView5]
    
    private lazy var passwordStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: viewArry)
        stview.spacing = 20
        stview.axis = .horizontal
        stview.alignment = .fill
        stview.distribution = .fillEqually
        return stview
    }()
    
    private lazy var passwordResetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 0.59, green: 0.63, blue: 0.63, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.setTitle("비밀번호를 몰라요", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    private lazy var passwordNumTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .clear
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    private lazy var passwordWordTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .clear
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    private lazy var plusTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.text = "+"
        tf.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        tf.textColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        return tf
    }()
    
    //MARK: - View Setting Code
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        customKeyboardSetting()
        customWordKeyboardSetting()
        
    }
    
    func configure() {
        view.backgroundColor = UIColor(red: 0.32, green: 0.34, blue: 0.37, alpha: 1.00)
        view.addSubview(labelStackView)
        view.addSubview(passwordStackView)
        view.addSubview(plusTextField)
        view.addSubview(passwordNumTextField)
        view.addSubview(passwordWordTextField)
        view.addSubview(passwordResetButton)

        setupAutoLayout()
        
        viewArry.remove(at: 4)
        
        passwordNumTextField.becomeFirstResponder()
    }
    
    func setupAutoLayout() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 30).isActive = true
        passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        passwordStackView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        for i in viewArry {
            i.layer.cornerRadius = 10.9
        }
        
        plusTextField.translatesAutoresizingMaskIntoConstraints = false
        plusTextField.leadingAnchor.constraint(equalTo: plusView.leadingAnchor, constant: 0).isActive = true
        plusTextField.topAnchor.constraint(equalTo: plusView.topAnchor, constant: 0).isActive = true
        plusTextField.bottomAnchor.constraint(equalTo: plusView.bottomAnchor, constant: 0).isActive = true
        
        passwordNumTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordNumTextField.topAnchor.constraint(equalTo: passwordTextFieldView1.topAnchor, constant: 0).isActive = true
        passwordNumTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView1.leadingAnchor, constant: 0).isActive = true
        passwordNumTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView1.bottomAnchor, constant: 0).isActive = true
        
        
        
        passwordWordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordWordTextField.topAnchor.constraint(equalTo: passwordTextFieldView5.topAnchor, constant: 0).isActive = true
        passwordWordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView5.leadingAnchor, constant: 0).isActive = true
        passwordWordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView5.bottomAnchor, constant: 0).isActive = true

        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 30).isActive = true
        passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135).isActive = true
        passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -135).isActive = true
        passwordResetButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //MARK: - Custom Keyboard Setting Code
    //Custom KeyBoard를 TextField에 연결하고 CustomKeyboard의 객체의 대리자를 지정하는 코드
    func customKeyboardSetting() {
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil)
        guard let myKeyboard = myKeyboard?.first as? CustomKeyboard else { return }
        myKeyboard.settingButton()
        myKeyboard.delegate = self
        self.passwordNumTextField.inputView = myKeyboard
    }
    
    //Custom KeyBoard2를 TextField에 연결하고 CustomKeyboard2의 객체의 대리자를 지정하는 코드
    func customWordKeyboardSetting() {
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard2", owner: nil)
        guard let myKeyboard = myKeyboard?.first as? CustomKeyboard2 else { return}
        myKeyboard.settingButton()
        myKeyboard.delegate = self
        self.passwordWordTextField.inputView = myKeyboard
    }
    
    //MARK: - Custom Protocol Func Code
    //Custom Keyboard에 입력된 키의 값을 받아와서 처리하는 코드
    func passString(text: String) {
        if inputCount < 4 {
            correctPasswordCheck(inputString: text)
        } else {
            correctPasswordCheck(inputString: text)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.checkingResult()
                self.inputReset()
            }
        }
    }
    
    // Custom Keyboard에 백스페이스바가 눌렸울때를 처리하는 코드
    func wordErase() {
        if inputCount > 0 {
            userPasswordAry[inputCount-1] = "?"
            viewArry[inputCount-1].backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
            inputCount -= 1
            changeTextfieldCheck()
            reChecking()
        } else {
            correctPassword = true
        }
    }
    
    // Custom Keyboard에 백스페이스바가 눌렸울때 패스워드를 재확인하는 코드
    func reChecking() {
        if correctPassword  == false && inputCount != 0 {
            for i in 0..<inputCount {
                if userPasswordAry[i] != systemPasswordAry[i] {
                    correctPassword = false
                    return
                }
            }
            correctPassword = true
        } else {
            correctPassword = true
        }
    }
    
    //MARK: - Password Input Reaction Func
    //입력된 버튼의 값이 패스워드와 일치하는지를 비교하는 코드
    func correctPasswordCheck(inputString: String) {
        if correctPassword == true {
            passwordCheck(inputString: inputString)
        } else {
            userPasswordAry[inputCount] = inputString
            viewArry[inputCount].backgroundColor = .white
            UIView.animate(withDuration: 0.5) {
                self.viewArry[self.inputCount].frame.size = CGSize(width: self.viewArry[self.inputCount].frame.width * 0.8, height: self.viewArry[self.inputCount].frame.height * 0.8)
            }
            inputCount += 1
            changeTextfieldCheck()
        }
    }
    
    func passwordCheck(inputString: String) {
        if inputString == systemPasswordAry[inputCount] {
            userPasswordAry[inputCount] = inputString
            viewArry[inputCount].backgroundColor = .white
            UIView.animate(withDuration: 0.5) {
                self.viewArry[self.inputCount].frame.size = CGSize(width: self.viewArry[self.inputCount].frame.width * 0.8, height: self.viewArry[self.inputCount].frame.height * 0.8)
            }
            inputCount += 1
            changeTextfieldCheck()
        } else {
            userPasswordAry[inputCount] = inputString
            correctPassword = false
            viewArry[inputCount].backgroundColor = .white
            UIView.animate(withDuration: 0.5) {
                self.viewArry[self.inputCount].frame.size = CGSize(width: self.viewArry[self.inputCount].frame.width * 0.8, height: self.viewArry[self.inputCount].frame.height * 0.8)
            }
            inputCount += 1
            changeTextfieldCheck()
        }
    }
    
    //숫자를 입력하는 차례인지 문자를 입력하는 차례인지를 판단하는 코드
    func changeTextfieldCheck() {
        if inputCount == 4 {
            passwordWordTextField.becomeFirstResponder()
        } else {
            passwordNumTextField.becomeFirstResponder()
        }
    }
    
    //유저가 입력이 끝났을 때 패스워드가 맞는지 아닌지 판단하는 코드
    func checkingResult() {
        if correctPassword == false {
            tryCount += 1
            tryCountCheck()
            return
        } else {
            passwordNumTextField.inputView = nil
            passwordWordTextField.inputView = nil
            let tdVC = ThirdViewController()
            tdVC.modalPresentationStyle = .fullScreen
            self.present(tdVC, animated: true, completion: nil)
        }
    }
    
    //유저가 입력한 횟수가 5회인지 아닌지 확인하는 코드
    func tryCountCheck() {
        if tryCount == 5 {
            dismiss(animated: true, completion: nil)
        }
    }
    
    //유저가 입력한 패스워드가 아닌경우 값을 초기화하는 코드
    func inputReset() {
        topLabel.text = "비밀번호가 맞지 않아요"
        bottomLabel.text = "다시 눌러주세요 \(tryCount)/5"
        bottomLabel.attributedText = labelTextColorChange(changeLabel: bottomLabel)
        passwordNumTextField.text = ""
        inputCount = 0
        correctPassword = true
        for i in 0..<viewArry.count {
            viewArry[i].backgroundColor = UIColor(red: 0.77, green: 0.82, blue: 0.82, alpha: 1.00)
            userPasswordAry[i] = "?"
        }
        passwordWordTextField.resignFirstResponder()
        passwordNumTextField.becomeFirstResponder()
    }
    
    //label의 text의 부분의 색만을 변경하는 코드
    func labelTextColorChange(changeLabel: UILabel) -> NSMutableAttributedString {
        let attributedStr = NSMutableAttributedString(string: changeLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (bottomLabel.text! as NSString).range(of: "\(tryCount)/5"))
        return attributedStr
    }
    
    //MARK: - ResetButton Func
    @objc func resetButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
