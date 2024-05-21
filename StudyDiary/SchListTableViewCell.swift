//
//  SchListTableViewCell.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/06.
//

import UIKit

class SchListTableViewCell: UITableViewCell {
    @IBOutlet weak var scheduleTitle: UILabel!
    @IBOutlet weak var scheduleDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
