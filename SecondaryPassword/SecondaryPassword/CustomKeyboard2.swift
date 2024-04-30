//
//  CustomKeyboard2.swift
//  SecondaryPassword
//
//  Created by 임동현 on 2024/04/29.
//

import UIKit

//MARK: - Protocol Code
protocol CustomKeyboard2Protocol: AnyObject {
    func passString(text: String)
    func wordErase()
}

class CustomKeyboard2: UIView {
    
    //MARK: - Property Code
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var Button10: UIButton!
    @IBOutlet weak var Button11: UIButton!
    @IBOutlet weak var Button12: UIButton!
    @IBOutlet weak var Button13: UIButton!
    @IBOutlet weak var Button14: UIButton!
    @IBOutlet weak var Button15: UIButton!
    @IBOutlet weak var Button16: UIButton!
    @IBOutlet weak var Button17: UIButton!
    @IBOutlet weak var Button18: UIButton!
    @IBOutlet weak var Button19: UIButton!
    @IBOutlet weak var Button20: UIButton!
    @IBOutlet weak var Button21: UIButton!
    @IBOutlet weak var Button22: UIButton!
    @IBOutlet weak var Button23: UIButton!
    @IBOutlet weak var Button24: UIButton!
    @IBOutlet weak var Button25: UIButton!
    @IBOutlet weak var Button26: UIButton!
    
    weak var delegate: CustomKeyboardProtocol?
    
    private var alphabetAry = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    lazy var buttonAry = [Button1, Button2, Button3, Button4, Button5, Button6, Button7, Button8, Button9, Button10, Button11, Button12, Button13, Button14, Button15, Button16, Button17, Button18, Button19, Button20, Button21, Button22, Button23, Button24, Button25, Button26]
    
    //MARK: - Func Code
    //view가 로드될때마다 button의 타이틀을 바꿔주는 코드
    func settingButton() {
        alphabetAry.shuffle()
        for i in 0..<alphabetAry.count {
            buttonAry[i]?.setTitle(alphabetAry[i], for: .normal)
        }
    }

    @IBAction func button1Tapped(_ sender: UIButton) {
        guard let string = Button1.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        guard let string = Button2.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        guard let string = Button3.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button4Tapped(_ sender: UIButton) {
        guard let string = Button4.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button5Tapped(_ sender: UIButton) {
        guard let string = Button5.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button6Tapped(_ sender: UIButton) {
        guard let string = Button6.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button7Tapped(_ sender: UIButton) {
        guard let string = Button7.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button8Tapped(_ sender: UIButton) {
        guard let string = Button8.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button9Tapped(_ sender: UIButton) {
        guard let string = Button9.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button10Tapped(_ sender: UIButton) {
        guard let string = Button10.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button11Tapped(_ sender: UIButton) {
        guard let string = Button11.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button12Tapped(_ sender: UIButton) {
        guard let string = Button12.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button13Tapped(_ sender: UIButton) {
        guard let string = Button13.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button14Tapped(_ sender: UIButton) {
        guard let string = Button14.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button15Tapped(_ sender: UIButton) {
        guard let string = Button15.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button16Tapped(_ sender: UIButton) {
        guard let string = Button16.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button17Tapped(_ sender: UIButton) {
        guard let string = Button17.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button18Tapped(_ sender: UIButton) {
        guard let string = Button18.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button19Tapped(_ sender: UIButton) {
        guard let string = Button19.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button20Tapped(_ sender: UIButton) {
        guard let string = Button20.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button21Tapped(_ sender: UIButton) {
        guard let string = Button21.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button22Tapped(_ sender: UIButton) {
        guard let string = Button22.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button23Tapped(_ sender: UIButton) {
        guard let string = Button23.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button24Tapped(_ sender: UIButton) {
        guard let string = Button24.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button25Tapped(_ sender: UIButton) {
        guard let string = Button25.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button26Tapped(_ sender: UIButton) {
        guard let string = Button26.titleLabel?.text else { return }
        delegate?.passString(text: string)
    }
    
    @IBAction func button27Tapped(_ sender: UIButton) {
        delegate?.wordErase()
    }
}
