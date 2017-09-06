//
//  ViewController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/09/04.
//  Copyright © 2017 Sasakura Hirofumi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //tableView読み込み
    var result: Results<WeightData>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        result = realm.objects(WeightData.self)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //画面が表示される時などに再読み込みする
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //セルに表示する文字列の個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result!.count
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "WeightCell")
        
        let object = result?[indexPath.row]
        
        // セルに表示する値を設定する
        cell.textLabel?.text = object?.name
        
        return cell
    }
    
    
    //セルがタップされた時に呼び出されるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    //Addボタンタップ
    //トレーニングメニューの追加を行う
    @IBAction func tapAddButton(_ sender: Any) {
        
        //アラートを生成
        let alert = UIAlertController(title: "トレーニングメニュー追加", message: "", preferredStyle: .alert)
        
        //OKボタンの設定
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            var textname: String = ""
            var textset: String = ""
            var textrep: String = ""
            var textoption: String = ""
            
            
            //OKを押した時入力されていたテキストを表示
            if let textFields = alert.textFields {
                
                //アラートに含まれるすべてのテキストフィールドを読み込む
                if textFields[0].text != nil {
                    textname = textFields[0].text!
                } else {
                    textname = "none"
                }
                
                if textFields[1].text != nil {
                    textset = textFields[1].text!
                } else {
                    textset = "1"
                }
                
                if textFields[2].text != nil {
                    textrep = textFields[2].text!
                } else {
                    textrep = "1"
                }
                
                if textFields[3].text != nil {
                    textoption = textFields[3].text!
                } else {
                    textoption = " "
                }
            }
            
            //Realmに保存する
            let realmController: RealmController  = RealmController.sharedInstance
            realmController.addWeightData(name: textname,set: textset,rep: textrep,option: textoption)
            
        })
        
        alert.addAction(okAction)
        
        //キャンセルボタンの設定
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        //トレーニングメニューを入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "トレーニングメニュー"
        })
        
        //セット数を入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "セット数"
        })
        
        //レップ数を入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "レップ数"
        })
        
        //説明文を入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "説明文"
        })
        
        //シミュレータの種類によっては、これがないと警告が発生
        alert.view.setNeedsLayout()
        
        //アラートを画面に表示
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    //Composeボタンタップ
    @IBAction func tapComposeButton(_ sender: Any) {
        
    }
    
    
    
    
    
}

