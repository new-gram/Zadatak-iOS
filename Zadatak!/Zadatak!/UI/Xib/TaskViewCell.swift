import UIKit

// MARK: TaskViewCell

final class TaskViewCell: UITableViewCell {
    
    @IBOutlet weak var dotView: CircleView!
    @IBOutlet weak var taskTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dotView.viewToCircle()
        taskTextField.delegate = self
    }
}

// MARK: UITextFieldDelegate

extension TaskViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

final class CircleView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width * 0.7
    }
}
