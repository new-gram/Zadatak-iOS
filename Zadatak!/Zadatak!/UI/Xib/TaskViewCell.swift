import UIKit

protocol TaskViewCellDelegate {
    func taskDeleted(_ sender: UIButton)
}

class TaskViewCell: UITableViewCell, ChooseColorDelegate {
    
    var delegate: TaskViewCellDelegate?
    var btnColor: UIColor?
    var deleteCheckBtnState: Bool?
    
    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var taskCheckBtn: UIButton!
    
    @IBAction func finishWork(_ sender: UIButton) {
        if !taskCheckBtn.isSelected {
            taskCheckBtn.isSelected = !taskCheckBtn.isSelected
            deleteCheckBtnState = taskCheckBtn.isSelected
            delegate?.taskDeleted(sender)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dot.viewToCircle()
        let view = as choose
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func sendColor(color: UIColor) {
        taskCheckBtn.tintColor = color
    }
}
