

import UIKit
import Firebase

class RegisterView: UIView {
    
    let color = UIColor()
    
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
    }
    
    func commitInit() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
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






