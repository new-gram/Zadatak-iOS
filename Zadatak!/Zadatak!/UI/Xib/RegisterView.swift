import UIKit
import Firebase

class RegisterView: UIView {

    let color = UIColor()
    var errorDelegate: RegisterViewDelegate?
    var bringNickNameDelegate: BringNickNameDelegate?
    
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
        commitInit()
    }
    
    func commitInit() {
        Bundle.main.loadNibNamed("RegisterView", owner: self, options: nil)
        self.addSubview(registerView)
        registerView.translatesAutoresizingMaskIntoConstraints = false
        registerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        registerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        registerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        registerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        registerView.makeShadow()
    }
    
    @IBAction func register(_ sender: UIButton) {
        if (registerEmailTextField.text != nil) || (registerNameTextField.text != nil) || (registerPWTextField.text != nil ) {
            Auth.auth().createUser(withEmail: registerEmailTextField.text!, password: registerPWTextField.text!) { authResult, error in
                guard let _ = authResult?.user, error == nil else {
                    print(error!.localizedDescription)
                    self.errorDelegate?.registerError(data: true)
                    // 실패하면 startVC에 신호줘서 알람뜨게, nickName을 가져와야 함
                    return
                }
                self.errorDelegate?.registerError(data: false)
                UserDefaults.standard.set(self.registerNameTextField.text, forKey: "Name")
            }
        }
    }
}

protocol RegisterViewDelegate { func registerError(data: Bool) }
protocol BringNickNameDelegate { func bringNickName(data: String) }



