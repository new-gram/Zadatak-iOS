import UIKit

protocol ChooseColorDelegate { func sendColor(color: UIColor) }
protocol DisMissNib { func logOut(value: Bool) }

class ChooseColorView: UIView {
    
    var color: UIColor?
    var colorDelegate: ChooseColorDelegate?
    var logOutDelegate: DisMissNib?
    
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
      //  NotificationCenter.default.addObserver(self, selector: #selector(chooseColor(_:)), name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }
    
    @IBAction func logOut() {
        logOutDelegate?.logOut(value: true)
    }
    
    @IBAction func chooseColor(_ sender: UIButton) {
        color = sender.currentTitleColor
        //colorInfoLabel.text = sender.currentTitleColor as? String
        optionLabel.backgroundColor = color
        logOutBtn.titleLabel?.textColor = color
        colorDelegate?.sendColor(color: color!)
    }
}

