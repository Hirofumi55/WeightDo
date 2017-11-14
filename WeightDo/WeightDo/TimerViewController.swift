//
//  TimerViewController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/11/03.
//  Copyright © 2017年 Sasakura Hirofumi. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    let now = Date()
    
    let formatter = DateFormatter()
//    formatterdataFormat = "yyyy//mm/dd HH:mm:ss"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
