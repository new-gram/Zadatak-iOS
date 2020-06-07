//
//  ViewController.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/11/22.
//  Copyright © 2019 이현욱. All rights reserved.
//

import Firebase
import UIKit

class StartViewController: UIViewController {
    
    var isAutoLogin = false

    @IBOutlet weak var backgroundBtnWhenXibOn: UIButton!
    @IBOutlet weak var hiddenViewForXib: UIView!
    @IBOutlet weak var register: RegisterView!
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
        register.errorDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisa(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        registerError(data: false)
    }
    
    @IBAction func autoLogin() {
        if keepLogInBtn.isSelected {
            isAutoLogin = true
            keepLogInBtn.setBackgroundImage(UIImage(contentsOfFile: "checkmark.square.fill"), for: .selected)
        } else {
            isAutoLogin = false
            keepLogInBtn.setBackgroundImage(UIImage(contentsOfFile: "square"), for: .selected)
        }
        if self.isAutoLogin{
            if logInEmailTextField.text != "" || logInPWTextField.text != "" {
                UserDefaults.standard.set(logInEmailTextField.text, forKey: "id")
                UserDefaults.standard.set(logInPWTextField.text, forKey: "pwd")
            }
        }
        keepLogInBtn.isSelected = !keepLogInBtn.isSelected
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        if logInEmailTextField.text == "" || logInPWTextField.text == "" {
            let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호가 비었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false)
        } else {
            Auth.auth().signIn(withEmail: logInEmailTextField.text!, password: logInPWTextField.text!) { [weak self] authResult, error in
                guard self != nil else { return }
                if let error = error {
                    print(error.localizedDescription)
                    let alert = UIAlertController(title: "로그인 실패", message: "아이디 혹은 비밀번호가 틀렸거나, 아이디가 없습니다", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self?.present(alert, animated: false)
                    return
                } else {
                    guard let vc = self?.storyboard?.instantiateViewController(identifier: "MainVC") as? MainViewController else { return }
                    vc.receivedBool = true
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func showRegisterXib(_ sender: UIButton) {
        register?.isHidden = false
        hiddenViewForXib.isHidden = false
        // 회원가입 창 떴을 때 바탕 터치하면 창 사라지기
    }
    @IBAction func tabbedBackground(_ sender: UIButton) {
        register.isHidden = true
        hiddenViewForXib.isHidden = true
    }
}

extension StartViewController: UITextFieldDelegate, RegisterViewDelegate {
    func registerError(data: Bool) {
        if data {
            let alert = UIAlertController(title: "로그인 실패", message: "아이디가 있거나 형식이 틀렸습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            register.isHidden = true
            hiddenViewForXib.isHidden = true
        }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
