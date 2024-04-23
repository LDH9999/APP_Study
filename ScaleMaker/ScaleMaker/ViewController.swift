//
//  ViewController.swift
//  ScaleMaker
//
//  Created by 임동현 on 2024/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var circleView1: UIView!
    @IBOutlet weak var circleView2: UIView!
    @IBOutlet weak var circleView3: UIView!
    @IBOutlet weak var circleView4: UIView!
    @IBOutlet weak var circleView5: UIView!
    @IBOutlet weak var circleView6: UIView!
    @IBOutlet weak var circleView7: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleInputTextfield: UITextField!
    var playButtonPressCount = 0
    let repeatCount = 2
    private var player: AVAudioPlayer?
    @IBOutlet weak var slider: UISlider!
    var dispatchWorkItem: [DispatchWorkItem] = []
    
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSetting()
        titleInputTextfield.delegate = self
    }

    func screenSetting() {
        inputButton.layer.cornerRadius = 10
        circleView1.layer.cornerRadius = 20
        circleView2.layer.cornerRadius = 20
        circleView3.layer.cornerRadius = 20
        circleView4.layer.cornerRadius = 20
        circleView5.layer.cornerRadius = 20
        circleView6.layer.cornerRadius = 20
        circleView7.layer.cornerRadius = 20
        playButton.layer.cornerRadius = 5
    }

    @IBAction func inputButtonTapped(_ sender: Any) {
        if titleInputTextfield.text == "" {
            errorLabel.text = "제목을 한 글자 이상 입력하세요."
        } else {
            titleLabel.text = titleInputTextfield.text
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if errorLabel.text == "제목을 한 글자 이상 입력하세요." {
            errorLabel.text = ""
        }
        return true
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if playButtonPressCount == 0 {
            playButton.setTitle("Stop", for: .normal)
            playButtonPressCount += 1
            slider.isEnabled = false
            let sliderValue = slider.value
            dispatchWorkItem = circleViewFuncSetting()
            circleView1.backgroundColor = UIColor(red: 0.93, green: 0.85, blue: 0.62, alpha: 1.00)
            playSound(fileName: "piano/FX_piano_0")
            let speed = Double(2) * Double(sliderValue)
            var excuteTime: Double = speed
            for i in 0...5 {
                            let item = dispatchWorkItem[i]
                            DispatchQueue.main.asyncAfter(deadline: .now() + excuteTime) {
                                item.perform()
//                              self.dispatchWorkItem[i].perform()
                            }
                            excuteTime += speed
                    }
                    return
        }
        playButton.setTitle("Play", for: .normal)
        slider.isEnabled = true
        playButtonPressCount -= 1
        resetSetting()
        for i in 0...5 {
                dispatchWorkItem[i].cancel()
        }
    }
    
    func circleViewFuncSetting() -> [DispatchWorkItem] {
        let discircleView2Func = DispatchWorkItem { [self] in
            self.circleView1.backgroundColor = UIColor.systemGray2
            self.circleView2.backgroundColor = UIColor(red: 0.73, green: 0.96, blue: 0.78, alpha: 1.00)
            self.playSound(fileName: "piano/FX_piano_1")
        }
        let discircleView3Func = DispatchWorkItem { [self] in
            self.circleView2.backgroundColor = UIColor.systemGray2
            self.circleView3.backgroundColor = UIColor(red: 0.89, green: 0.98, blue: 0.96, alpha: 1.00)
            self.playSound(fileName: "piano/FX_piano_2")
        }
        let discircleView4Func = DispatchWorkItem { [self] in
            self.circleView3.backgroundColor = UIColor.systemGray2
            self.circleView4.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
            self.playSound(fileName: "piano/FX_piano_3")
        }
        let discircleView5Func = DispatchWorkItem { [self] in
            self.circleView4.backgroundColor = UIColor.systemGray2
            self.circleView5.backgroundColor = UIColor(red: 0.96, green: 0.88, blue: 0.92, alpha: 1.00)
            self.playSound(fileName: "piano/FX_piano_4")
        }
        let discircleView6Func = DispatchWorkItem { [self] in
            self.circleView5.backgroundColor = UIColor.systemGray2
            self.circleView6.backgroundColor = UIColor(red: 0.83, green: 0.67, blue: 0.77, alpha: 1.00)
            self.playSound(fileName: "piano/FX_piano_5")
        }
        let discircleView7Func = DispatchWorkItem { [self] in
            self.circleView6.backgroundColor = UIColor.systemGray2
            self.circleView7.backgroundColor = UIColor(red: 0.93, green: 0.84, blue: 0.80, alpha: 1.00)
            self.playSound(fileName: "piano/FX_piano_6")
        }
        let circleViewFuncAry: [DispatchWorkItem] = [discircleView2Func, discircleView3Func, discircleView4Func, discircleView5Func, discircleView6Func, discircleView7Func]
        return circleViewFuncAry
    }
    
    func resetSetting() {
        circleView1.backgroundColor = UIColor.systemGray2
        circleView2.backgroundColor = UIColor.systemGray2
        circleView3.backgroundColor = UIColor.systemGray2
        circleView4.backgroundColor = UIColor.systemGray2
        circleView5.backgroundColor = UIColor.systemGray2
        circleView6.backgroundColor = UIColor.systemGray2
        circleView7.backgroundColor = UIColor.systemGray2
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("실패")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.numberOfLoops = -1
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.player?.stop()
        }
    }
    
}

