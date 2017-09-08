//
//  SettingViewController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/09/08.
//  Copyright © 2017 Sasakura Hirofumi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        
        //インスタンス生成
        let realmController = RealmController.sharedInstance
        
        //Realmのデータを全て削除
        realmController.allDeleteWeightData()
    }
    
}
