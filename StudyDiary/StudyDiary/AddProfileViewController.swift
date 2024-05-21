//
//  AddProfileViewController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/04.
//

import UIKit

protocol AddProVcProtocol: AnyObject {
    func reloadTableView()
}

class AddProfileViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nickNTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var mbtiTextField: UITextField!
    @IBOutlet weak var favotireTextField: UITextField!
    @IBOutlet weak var hobbyTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    weak var delegate: AddProVcProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingScreen()
    }
    
    func settingScreen() {
        addButton.layer.cornerRadius = 15
        addButton.backgroundColor = UIColor(red: 0.98, green: 0.91, blue: 0.64, alpha: 1.00)
        
        commentTextField.delegate = self
        mbtiTextField.delegate = self
        favotireTextField.delegate = self
        hobbyTextField.delegate = self
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if textFieldIsNil(textField: nickNTextField) || textFieldIsNil(textField: nameTextField) || textFieldIsNil(textField: ageTextField) ||
        textFieldIsNil(textField: commentTextField) ||
        textFieldIsNil(textField: mbtiTextField) ||
        textFieldIsNil(textField: favotireTextField) ||
            textFieldIsNil(textField: hobbyTextField) {
            errorLabel.text = "입력하지 않은 정보가 존재합니다!"
        } else {
            errorLabel.text = "추가되었습니다."
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.errorLabel.text = ""
            }
            ProfileDataSet.sampleData.append(ProfileDataSet(image: imageView.image!, nicName: nickNTextField.text!, name: nameTextField.text!, age: ageTextField.text!, comment: commentTextField.text!, mbti: mbtiTextField.text!, favorite: favotireTextField.text!, hobby: hobbyTextField.text!))
            textFieldClear()
            delegate?.reloadTableView()
        }
    }
    
    func textFieldIsNil(textField: UITextField) -> Bool {
        if textField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldClear() {
        nickNTextField.text = ""
        nameTextField.text = ""
        ageTextField.text = ""
        commentTextField.text = ""
        mbtiTextField.text = ""
        favotireTextField.text = ""
        hobbyTextField.text = ""
    }
}



extension AddProfileViewController {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
        textField.textAlignment = .left
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.textAlignment = .center
            switch textField {
            case self.commentTextField:
                textField.placeholder = "자기소개를 입력해 주세요."
            case self.mbtiTextField:
                textField.placeholder = "MBTI를 입력해 주세요."
            case self.favotireTextField:
                textField.placeholder = "관심분야를 입력해 주세요."
            case self.hobbyTextField:
                textField.placeholder = "취미를 입력해 주세요."
            default:
                return
            }
        }
    }
}
