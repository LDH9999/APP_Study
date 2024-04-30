//
//  CustomKeyboard.swift
//  SecondaryPassword
//
//  Created by 임동현 on 2024/04/28.
//

import UIKit

//MARK: - Protocol Code
protocol CustomKeyboardProtocol: AnyObject {
    func passString(text: String)
    func wordErase()
}

class CustomKeyboard: UIView {
    
    //MARK: - Property Code
    @IBOutlet weak var numButton1: UIButton!
    @IBOutlet weak var numButton2: UIButton!
    @IBOutlet weak var numButton3: UIButton!
    @IBOutlet weak var numButton4: UIButton!
    @IBOutlet weak var numButton5: UIButton!
    @IBOutlet weak var numButton6: UIButton!
    @IBOutlet weak var numButton7: UIButton!
    @IBOutlet weak var numButton8: UIButton!
    @IBOutlet weak var numButton9: UIButton!
    @IBOutlet weak var numButton10: UIButton!
    
    weak var delegate: CustomKeyboardProtocol?
    
    private var numAry = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    lazy var buttonAry = [numButton1, numButton2, numButton3, numButton4, numButton5, numButton6, numButton7, numButton8, numButton9, numButton10]
    
    //MARK: - Func Code
    //view가 로드될때마다 button의 타이틀을 바꿔주는 코드
    func settingButton() {
        numAry.shuffle()
        for i in 0..<buttonAry.count {
            buttonAry[i]?.setTitle(numAry[i], for: .normal)
        }
    }
    
    @IBAction func numButton1Tapped(_ sender: Any) {
        guard let string = numButton1.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton2Tapped(_ sender: UIButton) {
        guard let string = numButton2.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton3Tapped(_ sender: UIButton) {
        guard let string = numButton3.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton4Tapped(_ sender: UIButton) {
        guard let string = numButton4.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton5Tapped(_ sender: UIButton) {
        guard let string = numButton5.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton6Tapped(_ sender: UIButton) {
        guard let string = numButton6.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton7Tapped(_ sender: UIButton) {
        guard let string = numButton7.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton8Tapped(_ sender: UIButton) {
        guard let string = numButton8.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton9Tapped(_ sender: UIButton) {
        guard let string = numButton9.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton10Tapped(_ sender: UIButton) {
        guard let string = numButton10.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func numButton11Tapped(_ sender: UIButton) {
        delegate?.wordErase()
    }
}
