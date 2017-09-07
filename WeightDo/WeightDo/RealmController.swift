//
//  RealmController.swift
//  WeightDo
//
//  Created by Sasakura Hirofumi on 2017/09/05.
//  Copyright © 2017 Sasakura Hirofumi. All rights reserved.
//

import Foundation
import RealmSwift


class WeightData: Object {
    
    //トレーニングメニュー名
    dynamic var name: String = "none"
    
    //セット数
    dynamic var set: String = "1"
    
    //レップ数
    dynamic var rep: String = "1"
    
    //説明
    dynamic var option: String? = ""
    
}


class RealmController {
    
    //シングルトンの実装
    static let sharedInstance = RealmController()
    
    //デフォルトイニシャライザ
    init() {
        
    }
    
    //RealmのWeightDataを取得するメソッド
    func getWeightData() -> Results<WeightData> {
        let realm = try! Realm()
        let result = realm.objects(WeightData)
        
        return result
    }
    
    //RealmにWeightDataを追記するメソッド
    func addWeightData(name: String, set: String, rep: String, option: String) -> () {
        let realm = try! Realm()
        let weightData = WeightData()
        
        //インスタンスに値を代入する
        weightData.name = name
        weightData.set = set
        weightData.rep = rep
        weightData.option = option
        
        try! realm.write {
            realm.add(weightData)
        }
        
    }
    
    //Realmに指定したWeightDataを削除
    func deleteWeightData(weightData: WeightData) -> () {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(weightData)
        }
    }
    
    
    //Realmのデータをすべて削除する
    //テスト用などの機能であり通常使用しないこと
    func allDeleteWeightData() -> () {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    
    
}
