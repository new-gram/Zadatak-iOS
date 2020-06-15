import UIKit


protocol ChooseColorViewDelegate {
    func logOut(value: Bool)
    func setColor(color: UIColor)
}

// MARK: ChooseColorView

final class ChooseColorView: UIView {
    
    var delegate: ChooseColorViewDelegate?

    @IBOutlet weak var contentView: UIView!
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
        commonInit()
    }
    
    func commonInit() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last else { return }
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.makeShadow()
        self.addSubview(view)
    }
    
    @IBAction func getLogOut() {
        self.delegate?.logOut(value: true)
    }
    
    @IBAction func chooseColor(_ sender: UIButton) {
        var color = sender.currentTitleColor
        delegate?.setColor(color: color)
        optionLabel.backgroundColor = color
        logOutBtn.titleLabel?.textColor = color
        colorInfoLabel.text = Color(rawValue: sender.tag)?.name
    }
}

enum Color: Int {
    case Green = 1
    case Blue = 2
    case Red = 3
    case Black = 4
    
    var name: String {
        return String(describing: self)
    }
}
