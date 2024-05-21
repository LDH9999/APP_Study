//
//  ViewController.swift
//  Nav&Tab
//
//  Created by 임동현 on 2024/04/30.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate{
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.borderWidth = 1
        label1.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        label2.layer.borderWidth = 1
        label2.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        label3.layer.borderWidth = 1
        label3.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        label4.layer.borderWidth = 1
        label4.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        label5.layer.borderWidth = 1
        label5.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    

}

