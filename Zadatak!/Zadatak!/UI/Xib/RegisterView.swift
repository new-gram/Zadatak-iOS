import UIKit
import Firebase

// MARK: Deleagates

protocol RegisterViewDelegate { func registerError(data: Bool) }

// MARK: RegisterView

final class RegisterView: UIView {

    var errorDelegate: RegisterViewDelegate?
    
    @IBOutlet weak var registerView: RegisterView!
    @IBOutlet weak var registerTitleLbl: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var registerNameTextField: UITextField!
    @IBOutlet weak var registerEmailTextField: UITextField!
    @IBOutlet weak var registerPWTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // 이름 변경
    func commonInit() {
        Bundle.main.loadNibNamed("RegisterView", owner: self, options: nil)
        self.addSubview(registerView)
        registerView.makeShadow()
        registerView.translatesAutoresizingMaskIntoConstraints = false
        registerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        registerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        registerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        registerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    @IBAction func register(_ sender: UIButton) {
        if (registerEmailTextField.text!.isEmpty)
            || (registerNameTextField.text!.isEmpty)
            || (registerPWTextField.text!.isEmpty ) {
            Auth.auth().createUser(withEmail: registerEmailTextField.text!,
                                   password: registerPWTextField.text!) { authResult, error in
                guard let _ = authResult?.user, error == nil else {
                    print(error!.localizedDescription)
                    self.errorDelegate?.registerError(data: true) // 더 좋은 방법 생각해보기
                    return
                }
                UserDefaults.standard.set(self.registerNameTextField.text, forKey: "Name")
                self.errorDelegate?.registerError(data: false)
            }
        }
    }
}


