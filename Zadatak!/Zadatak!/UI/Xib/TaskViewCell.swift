import UIKit

protocol TaskViewCellDelegate {
    func taskDeleted(_ sender: UIButton, trueOrFalse: Bool)
}

class TaskViewCell: UITableViewCell {
    
    var delegate: TaskViewCellDelegate?
    var btnColor: UIColor?
    var deleteCheckBtnState: Bool?
    
    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var taskCheckBtn: UIButton!
    
    
    @IBAction func finishWork(_ sender: UIButton) {
        if !taskCheckBtn.isSelected {
            taskCheckBtn.isSelected = !taskCheckBtn.isSelected
            deleteCheckBtnState = true
            delegate?.taskDeleted(sender, trueOrFalse: deleteCheckBtnState!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dot.viewToCircle()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
