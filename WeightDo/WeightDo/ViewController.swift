//
//  ViewController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/09/04.
//  Copyright © 2017 Sasakura Hirofumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! //テーブルビュー
    @IBOutlet weak var dayTextField: UITextField! //タイトルのテキスト
    
    //筋トレメニューデータ
    var day: [String]?
    var name: [String]?
    var set: [String]?
    var rep: [String]?
    var option: [String]?
    
    var checked: [Bool] = [Bool](repeating: false, count: 100)
    
    override func viewDidLoad() {
        //super.viewDidLoad
        
        //UserDefaultsの読み込み
        let userDefaults = UserDefaults()
        
        //UserDefaultsが存在しているかの✔︎を実施して格納
        if UserDefaults.standard.object(forKey: "day") != nil {
            day = userDefaults.array(forKey: "day") as! [String]?
        } else {
            day = [" "]
        }
        
        if UserDefaults.standard.object(forKey: "name") != nil {
            name = userDefaults.array(forKey: "name") as! [String]?
        } else {
            name = [" "]
        }
        
        if UserDefaults.standard.object(forKey: "set") != nil {
            set = userDefaults.array(forKey: "set") as! [String]?
        } else {
            set = [" "]
        }
        
        if UserDefaults.standard.object(forKey: "rep") != nil {
            rep = userDefaults.array(forKey: "rep") as! [String]?
        } else {
            rep = [" "]
        }
        
        if UserDefaults.standard.object(forKey: "option") != nil {
            option = userDefaults.array(forKey: "option") as! [String]?
        } else {
            option = [" "]
        }
        
        //Table View読み込み
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
        
        //オプショナルバインディング
        if let name = self.name {
            return name.count
        }
        return 0
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "WeightCell")
        
        // セルに表示する値を設定する
        cell.textLabel?.text = name![indexPath.row]
        cell.detailTextLabel?.text = (rep![indexPath.row]) + "回  " + (set![indexPath.row]) + "セット"
        cell.detailTextLabel?.textColor = UIColor.gray
        
        return cell
    }
    
    //セルがタップされた時に呼び出されるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        //選択したセルにチェックマークをつける
        cell?.accessoryType = .checkmark
    }
    
    //Addボタンタップ
    //トレーニングメニューの追加を行う
    @IBAction func tapAddButton(_ sender: Any) {
        //アラート生成
        let alert = UIAlertController(title: "トレーニングメニュー追加", message: "", preferredStyle: .alert)
        //OKボタンの設定
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            var textday: String = ""
            var textname: String = ""
            var textset: String = ""
            var textrep: String = ""
            var textoption: String = ""
            
            //OKを押した時入力されていたテキストを格納
            if let textFields = alert.textFields {
                
                //アラートに含まれるすべてのテキストフィールドを読み込む
                if textFields[0].text != nil {
                    textday = textFields[0].text!
                } else {
                    textday = "1"
                }
                
                if textFields[1].text != nil {
                    textname = textFields[1].text!
                } else {
                    textname = "none"
                }
                
                if textFields[2].text != nil {
                    textset = textFields[2].text!
                } else {
                    textset = "5"
                }
                
                if textFields[3].text != nil {
                    textrep = textFields[3].text!
                } else {
                    textrep = "10"
                }
                
                if textFields[4].text != nil {
                    textoption = textFields[4].text!
                } else {
                    textoption = " "
                }
            }
            
            //データ更新処理
            self.day!.append(textday)
            self.name!.append(textname)
            self.set!.append(textset)
            self.rep!.append(textrep)
            self.option!.append(textoption)
            
            //UserDefaultsにデータを保存
            let userDefaults = UserDefaults()
            userDefaults.set(self.day, forKey: "day")
            userDefaults.set(self.name, forKey: "name")
            userDefaults.set(self.set, forKey: "set")
            userDefaults.set(self.rep, forKey: "rep")
            userDefaults.set(self.option, forKey: "option")
            
            self.tableView.reloadData()
        })
        
        alert.addAction(okAction)
        
        //キャンセルボタンの設定
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        //トレーニングメニューを入力するテキストフィールド
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
            textField.placeholder = "トレーニング種別"
        })
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
    
    
    //セルがスワイプされた時に呼び出されるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.day!.remove(at: indexPath.row)
            self.name!.remove(at: indexPath.row)
            self.set!.remove(at: indexPath.row)
            self.rep!.remove(at: indexPath.row)
            self.option!.remove(at: indexPath.row)
            
            //UserDefaults更新
            let userDefaults = UserDefaults()
            userDefaults.set(self.day, forKey: "day")
            userDefaults.set(self.name, forKey: "name")
            userDefaults.set(self.set, forKey: "set")
            userDefaults.set(self.rep, forKey: "rep")
            userDefaults.set(self.option, forKey: "option")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if self.checked[indexPath.row] == false {
            self.checked[indexPath.row] = true
            return true
        } else {
            self.checked[indexPath.row] = false
            return false
        }
    }

    //Composeボタンタップ
    @IBAction func tapComposeButton(_ sender: Any) {
        
    }

}


