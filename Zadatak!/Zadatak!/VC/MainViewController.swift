import UIKit

class MainViewController: UIViewController {
    
    var storedColor: UIColor?
    let ud = UserDefaults.standard
    var receivedBool = false
    var data = [String]()
    var dataCount = 0
    var doneTask = 0
    
    @IBOutlet weak var taskProgress: UIProgressView!
    @IBOutlet weak var addTaskBtn: UIButton!
    @IBOutlet weak var nickNameLbl: UILabel!
    @IBOutlet weak var chooseColorView: ChooseColorView!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        chooseColorView.colorDelegate = self
        chooseColorView.logOutDelegate = self
        super.viewDidLoad()
        listTable.dataSource = self
        listTable.delegate = self
        listTable.tableFooterView = UIView.init(frame: .infinite)
        isHiddenTrueOrFalse(value: true)
        nickNameLbl.text = ud.string(forKey: "Name")
        let nibName = UINib(nibName: "TaskViewCell", bundle: nil)
        listTable.register(nibName, forCellReuseIdentifier: "TaskViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisa(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        taskProgress.setProgress(0.0, animated: true)
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
        reloadTaskProgress()
        dataCount += 1
        print("dataCount:\(dataCount)")
    }
    
    @IBAction func showColorXib(_ sender: Any) {
        isHiddenTrueOrFalse(value: false)
    }
    
    @IBAction func disMissNib(_ sender: UIButton) {
        isHiddenTrueOrFalse(value: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, ChooseColorDelegate, DisMissNib {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            listTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath) as! TaskViewCell
        return cell
    }
    
    func logOut(value: Bool) {
        isHiddenTrueOrFalse(value: value)
        ud.removeObject(forKey: "id")
        ud.removeObject(forKey: "pwd")
        presentVC(identifier: "RegeisterVC")
    }
    
    func sendColor(color: UIColor) {
        storedColor = color
        taskProgress.tintColor = storedColor
        settingBtn.tintColor = storedColor
        addTaskBtn.tintColor = storedColor
    }
    
    func reloadTaskProgress() {
        if dataCount == 0 {
            taskProgress.progress = 0.0
        } else {
            taskProgress.progress = Float(doneTask)/Float(dataCount)
            print(Float(doneTask)/Float(dataCount))
        }
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
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillDisa(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
