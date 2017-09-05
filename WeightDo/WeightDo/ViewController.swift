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
    
    //let sample: [String]  = ["Swift", "Java", "Python", "JavaScript"]
    
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
    @IBAction func tapAddButton(_ sender: Any) {
        
    }
    
    //Composeボタンタップ
    @IBAction func tapComposeButton(_ sender: Any) {
    }
    
    
    
    
}

