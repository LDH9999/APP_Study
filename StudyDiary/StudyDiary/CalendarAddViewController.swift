//
//  CalendarAddViewController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/06.
//

import UIKit
import FSCalendar

protocol CalVcProtocol: AnyObject {
    func arrayPlus(string: String)
    func reloadTable()
}

class CalendarAddViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var scheduleTitle: UITextField!
    @IBOutlet weak var scheduleNote: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    weak var delegate: CalVcProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        addButton.layer.cornerRadius = 30
        addButton.backgroundColor = UIColor(red: 0.98, green: 0.91, blue: 0.64, alpha: 1.00)
        
        scheduleTitle.delegate = self
        scheduleNote.delegate = self
        
        datePicker.locale = Locale(identifier: "ko_KR")
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if textFieldIsNil(textField: scheduleTitle)
                          || textFieldIsNil(textField: scheduleNote) {
            errorLabel.text = "입력하지 않은 정보가 존재합니다!"
        } else {
            errorLabel.text = "추가되었습니다."
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.errorLabel.text = ""
            }
            scheduleData.sampleData.append(scheduleData(scheduleDate: datePicker.date, scheduleTitle: scheduleTitle.text!, scheduleNote: scheduleNote.text!))
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: datePicker.date)
            delegate?.arrayPlus(string: dateString)
            delegate?.reloadTable()
            textFieldClear()
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
        scheduleTitle.text = ""
        scheduleNote.text = ""
    }
    
    
}

extension CalendarAddViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
        textField.textAlignment = .left
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.textAlignment = .center
            switch textField {
            case self.scheduleTitle:
                textField.placeholder = "일정의 이름을 입력해주세요."
            case self.scheduleNote:
                textField.placeholder = "일정의 내용을 입력해 주세요."
            default:
                return
            }
        }
    }
}
