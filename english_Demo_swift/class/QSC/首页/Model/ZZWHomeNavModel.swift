//
//  ZZWHomeNavModel.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/4/12.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWHomeNavModel: NSObject {

    var area: String?
    var header: ZZWHomeHeader?
    var margin_bottom: String?
    var list: [ZZWHomeListDesc]?
    var project_list: [ZZWProjectTemplate]?

    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    override func mj_keyValuesDidFinishConvertingToObject() {
        self.list = ZZWHomeListDesc.mj_objectArray(withKeyValuesArray: self.list).copy() as? [ZZWHomeListDesc]
        self.project_list = ZZWProjectTemplate.mj_objectArray(withKeyValuesArray: self.project_list).copy() as? [ZZWProjectTemplate]

    }
    
}


class ZZWHomeHeader: NSObject {
    var title: String?
    var more: ZZWHomeMore?

}

class ZZWHomeMore: NSObject {
    var title: String?
    var url: String?
    
}

class ZZWHomeListDesc: NSObject {
    var title: String?
    var name: String?
    var image: String?
    var type_area: String?
    var url: String?
    
}
