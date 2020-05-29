//
//  TaskViewCell.swift
//  Zadatak!
//
//  Created by 이현욱 on 2020/01/03.
//  Copyright © 2020 이현욱. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {

    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var taskCheckBtn: UIButton!
    
//    override func viewToCircle() -> UIView {
//        dot.layer.cornerRadius = 0.5 * dot.bounds.size.width
//        return dot
//    }
//    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dot.viewToCircle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
