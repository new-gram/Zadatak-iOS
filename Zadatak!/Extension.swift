//
//  Extension.swift
//  Zadatak!
//
//  Created by 이현욱 on 2020/01/03.
//  Copyright © 2020 이현욱. All rights reserved.
//

import UIKit

extension UIButton {
    func btnToCircle() -> UIButton {
        let btn = UIButton()
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        return btn
    }
    
    func changeBtnSize() {
        let myButton = UIButton()
        myButton.titleLabel?.adjustsFontSizeToFitWidth = true
        myButton.titleLabel?.numberOfLines = 0
        myButton.titleLabel?.minimumScaleFactor = 0.6
    }
}

extension UIView {
    func chooseColor(btn: UIButton) -> UIView {
        let view = UIView()
        view.backgroundColor = btn.backgroundColor
        return view
    }
    
    func viewToCircle() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 0.5 * view.bounds.size.width
        return view
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2.75)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3
    }
}

