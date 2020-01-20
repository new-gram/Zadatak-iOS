//
//  MainViewController.swift
//  Zadatak!
//
//  Created by 이현욱 on 2019/11/28.
//  Copyright © 2019 이현욱. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }

}
