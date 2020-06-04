import UIKit

class MainViewController: UIViewController, sendColorDelegate, bringNickName {

    var receivedBool = false
    
    @IBOutlet weak var nickNameLbl: UILabel!
    @IBOutlet weak var chooseColorView: ChooseColorView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var listTable: UITableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addSubview(progressView)
        listTable.dataSource = self
        listTable.delegate = self
        hiddenView.isHidden = true
        chooseColorView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if receivedBool == false {
            if UserDefaults.standard.string(forKey: "id") == nil {
                guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegeisterVC") else { return }
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func showColorXib(_ sender: Any) {
        hiddenView.isHidden = false
        chooseColorView.isHidden = false
    }
    
    func pickColor(data: UIColor) {
        settingBtn.setTitleColor(data, for: .normal)
    }
    
    func bringNickName(data: String) {
        nickNameLbl.text = data
    }
    
    
    /* lazy var progressView: UIProgressView = { // Create a ProgressView.
     let pv: UIProgressView = UIProgressView(frame: CGRect(x:0, y:0, width:280, height:30))
     NSLayoutConstraint.activate([
     pv.leftAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20.0)
     ])
     pv.progressTintColor = UIColor.green
     pv.trackTintColor = UIColor.white // Set the coordinates.
     pv.layer.position = CGPoint(x: self.view.frame.width/2, y: 200) // Set the height of the bar (1.0 times horizontally, 2.0 times vertically).
     pv.transform = CGAffineTransform(scaleX: 1.0, y: 2.0) // Set the progress degree (0.0 to 1.0).
     pv.progress = 0.0 // Add an animation.
     pv.setProgress(1.0, animated: true)
     return pv
     }()*/
    
    // 설정에서 로그아웃만들면 스타트뷰로 이동
    
    
}
 
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath) as! TaskViewCell
        return cell
    }
}
