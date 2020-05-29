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
    @IBOutlet weak var keepLogInTextBtn: UIButton!
    @IBOutlet weak var keepLogInBtn: UIButton!
    @IBOutlet weak var goToMainBtn: UIButton!
    @IBOutlet weak var showRegeisterViewBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register?.isHidden = true
        hiddenViewForXib.isHidden = true
        logInEmailTextField.delegate = self
        logInPWTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisa(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    @IBAction func autoLogin(_ sender: UIButton) {
            if sender.isSelected == true {
                isAutoLogin = true
                keepLogInBtn.setImage(UIImage(contentsOfFile: "checkmark.square.fill"), for: .selected)
            } else {
                isAutoLogin = false
                keepLogInBtn.setImage(UIImage(contentsOfFile: "square"), for: .normal)
            }
        if self.isAutoLogin{
            if logInEmailTextField.text != "" || logInPWTextField.text != "" {
                UserDefaults.standard.set(logInEmailTextField.text, forKey: "id")
                UserDefaults.standard.set(logInPWTextField.text, forKey: "pwd")
            }
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        if logInEmailTextField.text == "" || logInPWTextField.text == "" {
            let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호가 비었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false)
        }
        // 파이어베이스 공부하고 난뒤에 로그인 성공 후 메인VC로 present
    }

    @IBAction func showRegisterXib(_ sender: UIButton) {
        register?.isHidden = false
        hiddenViewForXib.isHidden = false
        //hiddenViewForXib.alpha = 0.65
        register.alpha = 10
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillDisa(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
}

// 회원가입 창 떴을 때 바탕 터치하면 창 사라지기
// 스타트 VC 모달이 아닌 VC로 보여지기 
