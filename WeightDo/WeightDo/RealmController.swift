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
    dynamic var weightName: String = "none"
    
    //セット数
    dynamic var set: String = "1"
    
    //レップ数
    dynamic var rep: String = "1"
    
    //説明
    dynamic var option: String? = ""
    
    
}
