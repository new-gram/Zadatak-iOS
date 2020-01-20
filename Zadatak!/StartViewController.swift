//
//  ViewController.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/11/22.
//  Copyright © 2019 이현욱. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {

    var isAutoLogin = false
    
    
    @IBOutlet weak var hiddenViewForXib: UIView!
    @IBOutlet weak var register: Register!
    @IBOutlet weak var logInEmailTextField: UITextField!
    @IBOutlet weak var logInPWTextField: UITextField!
    @IBOutlet weak var keepLogInBtn: UIButton!
    @IBOutlet weak var goToMainBtn: UIButton!
    @IBOutlet weak var showRegeisterViewBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register?.isHidden = true
        hiddenViewForXib.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    @IBAction func autoLogin(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
            if sender.isSelected == true {
                isAutoLogin = true
            } else {
                isAutoLogin = false
            }
        if self.isAutoLogin{
            UserDefaults.standard.set(logInEmailTextField.text, forKey: "id")
            UserDefaults.standard.set(logInPWTextField.text, forKey: "pwd")
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        if logInEmailTextField.text == "" || logInPWTextField.text == "" {
            let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호가 비었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false)
        }
    }

    @IBAction func showRegisterXib(_ sender: UIButton) {
        register?.isHidden = false
        hiddenViewForXib.isHidden = false
    }
}

