//
//  fellTextField.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/12/06.
//  Copyright © 2019 이현욱. All rights reserved.
//

import UIKit


class fellTextField: UITextField {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
}

