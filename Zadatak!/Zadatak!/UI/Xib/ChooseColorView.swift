//
//  chooseColor.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/11/28.
//  Copyright © 2019 이현욱. All rights reserved.
//

import UIKit

class ChooseColorView: UIView { 
    
    var delegate: sendColorDelegate?
    
    @IBOutlet weak var colorInfoLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var redColorBtn: UIButton!
    @IBOutlet weak var blueColorBtn: UIButton!
    @IBOutlet weak var greenColorBtn: UIButton!
    @IBOutlet weak var blackColorBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commitInit() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        view.makeShadow()
    }
    
    @IBAction func logOut() {
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pw")
        // StartView로 이동
    }
    
    @IBAction func chooseColor(_ sender: UIButton) {
        let color = sender.currentTitleColor
        delegate?.pickColor(data: color)
    }
}

protocol sendColorDelegate { func pickColor(data: UIColor) }
