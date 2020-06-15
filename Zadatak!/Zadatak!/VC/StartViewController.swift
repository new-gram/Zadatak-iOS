import Firebase
import UIKit

// MARK: StartViewController
class StartViewController: UIViewController {
    
    var isAutoLogin = false
    let ud = UserDefaults.standard

    @IBOutlet weak var backgroundBtnWhenXibOn: UIButton!
    @IBOutlet weak var register: RegisterView!
    @IBOutlet weak var logInEmailTextField: UITextField!
    @IBOutlet weak var logInPWTextField: UITextField!
    @IBOutlet weak var keepLogInTextBtn: UIButton!
    @IBOutlet weak var keepLogInBtn: UIButton!
    @IBOutlet weak var goToMainBtn: UIButton!
    @IBOutlet weak var showRegeisterViewBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegate()
        isHiddenTrueOrFalse(value: true)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisa(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func autoLogin() {
        if keepLogInBtn.isSelected {
            isAutoLogin = true
            keepLogInBtn.setBackgroundImage(UIImage(contentsOfFile: "checkmark.square.fill"), for: .selected)
            if !logInEmailTextField.text!.isEmpty || !logInPWTextField.text!.isEmpty {
                ud.set(logInEmailTextField.text, forKey: "id")
                ud.set(logInPWTextField.text, forKey: "pwd")
            }
        } else {
            isAutoLogin = false
            keepLogInBtn.setBackgroundImage(UIImage(contentsOfFile: "square"), for: .selected)
            ud.removeObject(forKey: "id")
            ud.removeObject(forKey: "pwd")
        }
        keepLogInBtn.isSelected = !keepLogInBtn.isSelected
    }
    
    @IBAction func login(_ sender: UIButton) {
        if logInEmailTextField.text!.isEmpty || logInPWTextField.text!.isEmpty {
            presentAlert(Title: "로그인 실패", Message: "아이디 혹은 비밀번호가 비었습니다.")
        } else {
            Auth.auth().signIn(withEmail: logInEmailTextField.text!, password: logInPWTextField.text!) { [weak self] authResult, error in
                guard self != nil else { return }
                if error != nil {
                    self!.presentAlert(Title: "로그인 실패", Message: "아이디 혹은 비밀번호가 틀렸거나, 아이디가 없습니다")
                    return
                } else {
                    guard let vc = self?.storyboard?.instantiateViewController(identifier: "MainVC") as? MainViewController else { return }
                    vc.modalPresentationStyle = .fullScreen
                    vc.isLogin = true
                    self?.present(vc, animated: true, completion: nil)
                }
            }
        }
    }

    @IBAction func presentXib(_ sender: UIButton) {
        isHiddenTrueOrFalse(value: false)
    }
    
    @IBAction func disMissXib(_ sender: UIButton) {
        isHiddenTrueOrFalse(value: true)
    }
    
    private func setDelegate() {
        logInEmailTextField.delegate = self
        logInPWTextField.delegate = self
        register.delegate = self
    }
}

extension StartViewController: UITextFieldDelegate, RegisterViewDelegate {
    func registerError(value: Bool) {
        if value {
            presentAlert(Title: "회원가입 실패", Message: "아이디가 있거나 형식에 맞지 않습니다.")
        }
    }
    
    func presentAlert(Title: String, Message: String) {
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func isHiddenTrueOrFalse(value: Bool) {
        register.isHidden = value
        backgroundBtnWhenXibOn.isHidden = value
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
