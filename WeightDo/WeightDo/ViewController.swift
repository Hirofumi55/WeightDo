//
//  ViewController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/09/04.
//  Copyright © 2017 Sasakura Hirofumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sample: [String]  = ["Swift", "Java", "Python", "JavaScript"]
    
    let weightMenu: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //セルに表示する文字列の個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weightMenu.count
    }
    
    //セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "WeightCell")
        
        // セルに表示する値を設定する
        cell.textLabel?.text = weightMenu[indexPath.row]
        
        return cell
    }
    
    
    //セルがタップされた時に呼び出されるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
}

