//
//  Extension.swift
//  Zadatak!
//
//  Created by 이현욱 on 2020/01/03.
//  Copyright © 2020 이현욱. All rights reserved.
//

import UIKit

extension UIButton {
    func btnToCircle() {
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }
    
    func changeBtnSize() {
        let myButton = UIButton()
        myButton.titleLabel?.adjustsFontSizeToFitWidth = true
        myButton.titleLabel?.numberOfLines = 0
        myButton.titleLabel?.minimumScaleFactor = 0.6
    }
}

extension UIView {
    func viewToCircle(){
        self.layer.cornerRadius = 0.7 * self.bounds.size.width
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2.75)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3
    }
}

