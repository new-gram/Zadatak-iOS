import UIKit

// MARK: TaskViewCell

final class TaskViewCell: UITableViewCell {
    
    @IBOutlet weak var dotView: CircleView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dotView.viewToCircle()
        taskTextField.delegate = self
        taskLabel.isHidden = true
    }
    
    // 더 좋은 이름으로 바꾸세요
    private func setToLbl(to value: Bool) {
        if !value { return }
        taskLabel.text = taskTextField.text
        taskLabel.isHidden = false
        taskTextField.isHidden = value
        taskTextField.text = nil
    }
}

// MARK: UITextFieldDelegate

extension TaskViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        setToLbl(to: true)
        return true
    }
}

final class CircleView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width * 0.7
    }
}
