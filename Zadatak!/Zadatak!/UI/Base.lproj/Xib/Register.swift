

import UIKit
import Firebase

class Register: UIView {
    
    let color = UIColor()
    
    @IBOutlet weak var registerMainView: UIView!
    @IBOutlet weak var registerTitleLbl: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var registerNameTextField: UITextField!
    @IBOutlet weak var registerEmailTextField: UITextField!
    @IBOutlet weak var registerPWTextField: UITextField!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    func commitInit() {
        Bundle.main.loadNibNamed("Register", owner: self, options: nil)
        addSubview(registerMainView)
        registerMainView.makeShadow()
    }

    @IBAction func register(_ sender: UIButton) {
        if (registerEmailTextField.text == nil || false) || (registerNameTextField.text == nil || false) || (registerPWTextField.text == nil || false) {
            
            }
        Auth.auth().createUser(withEmail: registerEmailTextField.text!, password: registerPWTextField.text!) { authResult, error in
          print("성공")
        }
        }
    }
    
    


