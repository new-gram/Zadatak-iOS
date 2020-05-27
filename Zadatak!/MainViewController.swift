//
//  MainViewController.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/11/28.
//  Copyright © 2019 이현욱. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath) as! TaskViewCell
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.addSubview(progressView)
        listTable.dataSource = self
        listTable.delegate = self
        print(UserDefaults.standard.string(forKey: "id"))
        UserDefaults.standard.removeObject(forKey: "id")
        if UserDefaults.standard.string(forKey: "id") == nil {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegeisterVC") else { return }
            present(vc, animated: true, completion: nil)
            print(UIApplication.shared.keyWindow?.rootViewController)
        }
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
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

    

}

