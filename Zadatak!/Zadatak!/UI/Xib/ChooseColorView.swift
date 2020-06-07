import UIKit
// 색, 로그아웃
class ChooseColorView: UIView {
    
    var color: UIColor?
    var delegate: ChooseColorViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var colorInfoLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var redColorBtn: UIButton!
    @IBOutlet weak var blueColorBtn: UIButton!
    @IBOutlet weak var greenColorBtn: UIButton!
    @IBOutlet weak var blackColorBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    func commitInit() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.makeShadow()
        self.addSubview(view)
    }
    
    @IBAction func logOut() {
        delegate?.logOut()
    }
    
    @IBAction func chooseColor(_ sender: UIButton) {
        color = sender.currentTitleColor
        colorInfoLabel.text = sender.currentTitleColor as? String
        optionLabel.backgroundColor = color
        logOutBtn.titleLabel?.textColor = color
        delegate?.sendColor(color: color!)
    }
}

protocol ChooseColorViewDelegate {
    func sendColor(color: UIColor)
    func logOut()
}
