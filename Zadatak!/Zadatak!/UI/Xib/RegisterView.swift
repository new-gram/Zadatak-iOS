import UIKit
import Firebase

class RegisterView: UIView {
    
    let color = UIColor()
    
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
        if (registerEmailTextField.text == nil || false) || (registerNameTextField.text == nil || false) || (registerPWTextField.text == nil || false) {
            Auth.auth().createUser(withEmail: registerEmailTextField.text!, password: registerPWTextField.text!) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                print("\(user.email!) created")
                self.removeFromSuperview()
            }
        }
    }
}






