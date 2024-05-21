//
//  EditViewController.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/20.
//

import UIKit
import PhotosUI

//MARK: - Delegate 패턴을 위한 프로토콜 정의
protocol EditViewProtocol: AnyObject {
    func compareThings(things: Things) -> Bool
    func updateData(things: Things)
}

protocol AddViewProtocol: AnyObject {
    func addList(things: Things)
}

class EditViewController: UIViewController {
    
    //MARK: - 필요한 요소들 선언
    private var editView = EditView()
    var things: Things?
    private var imageArry: [UIImage] = []
    weak var editDelegate: EditViewProtocol?
    weak var addDelegate: AddViewProtocol?
    
    //MARK: - 뷰 교체
    override func loadView() {
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if screenSetting() {
            defaultSetting(title: "작성 완료", fuc: setupEditButtonAction)
        } else {
            defaultSetting(title: "추가하기", fuc: setupPlusButtonAction)
        }
    }
    
    //이전 화면이 무엇인지 확인하여 서로 다른 기능들을 구현
    private func screenSetting() -> Bool {
        if navigationController?.viewControllers.dropLast(1).last is TingsInfoViewController {
            return true
        } else {
            return false
        }
    }
    
    //기능이 다르더라도 공통으로 필요한 함수들을 모음
    func defaultSetting(title: String, fuc: () -> ()) {
        setupData()
        setupTapGestures()
        setDelegate()
        buttonTitleSetting(title: title)
        fuc()
    }
    
    private func setupData() {
        editView.things = things
    }
    
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        editView.thingsImageView.addGestureRecognizer(tapGesture)
        editView.thingsImageView.isUserInteractionEnabled = true
    }
    
    func setDelegate() {
        editView.thingsTitleTextField.delegate = self
        editView.addressTextField.delegate = self
        editView.priceTextField.delegate = self
        editView.commentTextField.delegate = self
    }
    
    func buttonTitleSetting(title: String) {
        editView.editButton.setTitle(title, for: .normal)
    }
    
    //MARK: - 서로 다른 기능을 button에 추가
    func setupEditButtonAction() {
        editView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    func setupPlusButtonAction() {
        editView.editButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    @objc func editButtonTapped() {
        if inspectionImageView(imageView: editView.thingsImageView) && inspectionTextField(textField: editView.thingsTitleTextField) && inspectionTextField(textField: editView.addressTextField) && inspectionTextField(textField: editView.priceTextField) &&
            inspectionTextField(textField: editView.commentTextField) {
            guard let bool = editDelegate?.compareThings(things: things!) else { return }
            if bool {
                editView.errorLabel.text = "수정한 데이터가 없습니다!"
            } else {
                editDelegate?.updateData(things: things!)
                navigationController?.popViewController(animated: true)
            }
        } else {
            editView.errorLabel.text = "빈칸이 존재합니다!"
        }
    }
    
    @objc func plusButtonTapped() {
        if inspectionImageView(imageView: editView.thingsImageView) && inspectionTextField(textField: editView.thingsTitleTextField) && inspectionTextField(textField: editView.addressTextField) && inspectionTextField(textField: editView.priceTextField) &&
            inspectionTextField(textField: editView.commentTextField) {
                addDelegate?.addList(things: things!)
                navigationController?.popViewController(animated: true)
            } else {
            editView.errorLabel.text = "빈칸이 존재합니다!"
        }
    }
    
    //MARK: - ImageView와 TextField가 비어있는지 검사하는 함수
    private func inspectionTextField(textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        } else {
            return true
        }
    }
    
    private func inspectionImageView(imageView: UIImageView) -> Bool {
        if imageView.image == nil {
            return false
        } else {
            return true
        }
    }
    
    //MARK: - ImagePicker 설정
    @objc func pickImage() {
        setImagePicker()
    }
    
    func setImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self

        imageArry = []
        self.present(picker, animated: true, completion: nil)
    }
}

//MARK: - ImagePicker Delegate 정의
extension EditViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        for i in 0..<results.count {
            let itemProvider = results[i].itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self){
                itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                        let selectImage = image as? UIImage
                        self.imageArry.append(selectImage!)
                }
            } else {
                print("이미지 불러오기 실패")
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.things?.thingsImage = self.imageArry
            self.setupData()
        }
    }
}

//MARK: - TextField Delegate 정의
extension EditViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        
        switch textField {
        case editView.thingsTitleTextField:
            things?.thingsName = textField.text
        case editView.addressTextField:
            things?.address = textField.text
        case editView.priceTextField:
            things?.price = Int(textField.text!)
        case editView.commentTextField:
            things?.comment = textField.text
        default:
            return
        }
    }
}
    
    



