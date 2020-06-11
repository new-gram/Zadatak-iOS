import UIKit

class TaskViewCell: UITableViewCell, UITextFieldDelegate {
    
    var changeToLabel: Bool?
    
    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dot.viewToCircle()
        taskTextField.delegate = self
        taskLabel.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        changeToLabel = true
        
        changeToLabelFunc()
        return true
    }
    
    func changeToLabelFunc() {
        if changeToLabel != false {
            taskLabel.text = taskTextField.text
            taskLabel.isHidden = false
            print(1)
            taskTextField.isHidden = true
            taskTextField.text = nil
        }
    }
}
