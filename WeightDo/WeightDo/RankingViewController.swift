//
//  RankingViewController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/10/13.
//  Copyright © 2017年 Sasakura Hirofumi. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet weak var benchMax: UILabel!
    @IBOutlet weak var deadMax: UILabel!
    @IBOutlet weak var squatMax: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        let bench: String? = userDefaults.object(forKey: "bench") as? String
        let dead: String? = userDefaults.object(forKey: "dead") as? String
        let squat: String? = userDefaults.object(forKey: "squat") as? String
        
        if let maxbench = bench {
            benchMax.text = maxbench
        } else {
            benchMax.text = "0kg"
        }
        
        if let maxdead = dead {
            deadMax.text = maxdead
        } else {
            deadMax.text = "0kg"
        }
        
        if let maxsquat = squat {
            squatMax.text = maxsquat
        } else {
            squatMax.text = "0kg"
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //Edit Buttonをタップ
    @IBAction func tapEditButton(_ sender: Any) {
        //アラート生成
        let alert = UIAlertController(title: "Max値の設定", message: "", preferredStyle: .alert)
        
        //OKボタンの設定
        //クロージャで実装
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            var textbench: String = ""
            var textdead: String = ""
            var textsquat: String = ""
            
            //OKを押した時入力されていたテキストを格納
            if let textFields = alert.textFields {
                
                //アラートに含まれるすべてのテキストフィールドを読み込む
                if textFields[0].text != nil {
                    textbench = textFields[0].text! + "kg"
                } else {
                    textbench = "0kg"
                }
                
                if textFields[1].text != nil {
                    textdead = textFields[1].text! + "kg"
                } else {
                    textdead = "0kg"
                }
                
                if textFields[2].text != nil {
                    textsquat = textFields[2].text! + "kg"
                } else {
                    textsquat = "0kg"
                }
            }
            
            //UserDefaultsにデータを保存
            let userDefaults = UserDefaults()
            userDefaults.set(textbench, forKey: "bench")
            userDefaults.set(textdead, forKey: "dead")
            userDefaults.set(textsquat, forKey: "squat")
            
        })
        
        alert.addAction(okAction)
        
        //キャンセルボタンの設定
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        //トレーニングメニューを入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "ベンチプレスMAX"
        })
        //トレーニングメニューを入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "デッドリフトMAX"
        })
        //セット数を入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "スクワットMAX"
        })
        
        //シミュレータの種類によっては、これがないと警告が発生
        alert.view.setNeedsLayout()
        
        //アラートを画面に表示
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
}
