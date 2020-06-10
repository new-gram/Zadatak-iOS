import UIKit

class TaskViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var taskTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dot.viewToCircle()
        taskTextField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
