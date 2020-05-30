//
//  chooseColor.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/11/28.
//  Copyright © 2019 이현욱. All rights reserved.
//

import UIKit

class chooseColorView: UIView {

    @IBOutlet weak var selectColorView: UIView!
    @IBOutlet weak var colorInfoLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var redColorBtn: UIButton!
    @IBOutlet weak var blueColorBtn: UIButton!
    @IBOutlet weak var greenColorBtn: UIButton!
    @IBOutlet weak var showPresentColorAndChooseYourColorBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
        }
          
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
      }
      
    func commitInit() {
        Bundle.main.loadNibNamed("chooseColor", owner: self, options: nil)
        addSubview(selectColorView)
        selectColorView.makeShadow()
      }
    
    
    
    
    
}

