//
//  ZZWObject.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/4.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit


class ZZWObject: NSObject {
    
    var cover:[QSCImage]?
    var backer_count: String?
    var current_amount: String?
    var progress: String?
    var template: String?
    var title: String?
    var uuid: String?
    
//    init(dict: [String : AnyObject]) {
//        super.init()
//        setValuesForKeys(dict)
//    }
    
    // `NSObject` 默认在发现没有定义的键值时，会抛出 `NSUndefinedKeyException` 异常
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

    
    override func mj_keyValuesDidFinishConvertingToObject() {
        self.cover = QSCImage.mj_objectArray(withKeyValuesArray: self.cover).copy() as? [QSCImage]
    }

 
}
