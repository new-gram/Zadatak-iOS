import UIKit

class MainViewController: UIViewController {
    
    let ud = UserDefaults.standard
    var receivedBool = false
    var data = [String]()
    
    @IBOutlet weak var addTaskBtn: UIButton!
    @IBOutlet weak var nickNameLbl: UILabel!
    @IBOutlet weak var chooseColorView: ChooseColorView!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var listTable: UITableView!
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        listTable.dataSource = self
        listTable.delegate = self
        listTable.tableFooterView = UIView.init(frame: .infinite)
        isHiddenTrueOrFalse(value: true)
        nickNameLbl.text = ud.string(forKey: "Name")
        //self.view.addSubview(progressView)
        let nibName = UINib(nibName: "TaskViewCell", bundle: nil)
        listTable.register(nibName, forCellReuseIdentifier: "TaskViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if receivedBool == false {
            if ud.string(forKey: "id") == nil {
                presentVC(identifier: "RegeisterVC")
            }
        }
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        data.append("")
        listTable.reloadData()
    }
    
    @IBAction func showColorXib(_ sender: Any) {
        isHiddenTrueOrFalse(value: false)
    }
    @IBAction func disMissNib(_ sender: UIButton) {
        isHiddenTrueOrFalse(value: true)
    }
}
    
extension MainViewController: UITableViewDelegate, UITableViewDataSource, ChooseColorDelegate {
    
    func sendColor(color: UIColor) {
        settingBtn.tintColor = color
    }
    
    func logOut() {
        chooseColorView.isHidden = true
        hiddenBtn.isHidden = true
        ud.removeObject(forKey: "id")
        ud.removeObject(forKey: "pwd")
        ud.removeObject(forKey: "Name")
        presentVC(identifier: "RegeisterVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath) as! TaskViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func isHiddenTrueOrFalse(value: Bool) {
        chooseColorView.isHidden = value
        hiddenBtn.isHidden = value
    }
    
    func presentVC(identifier: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: identifier) else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
//
//    lazy var progressView: UIProgressView = { // Create a ProgressView.
//    let pv: UIProgressView = UIProgressView(frame: CGRect(x:0, y:0, width:280, height:30))
//    NSLayoutConstraint.activate([
//    pv.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20.0)
//    ])
//    pv.progressTintColor = UIColor.green
//    pv.trackTintColor = UIColor.white // Set the coordinates.
//    pv.layer.position = CGPoint(x: self.view.frame.width/2, y: 200) // Set the height of the bar (1.0 times horizontally, 2.0 times vertically).
//    pv.transform = CGAffineTransform(scaleX: 1.0, y: 2.0) // Set the progress degree (0.0 to 1.0).
//    pv.progress = 0.0 // Add an animation.
//    pv.setProgress(1.0, animated: true)
//    return pv
//    }()
}
