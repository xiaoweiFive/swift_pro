//
//  ZZWProjectTemplate.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/23.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class ZZWProjectTemplate: NSObject {

    var uuid: String?
    var template_id: String?
    var category_id: String?
    var title: String?
    var desc: String?
    var location: String?
    var cover: Array<Any>?
    var brand: Array<Any>?
    
    var created_at: String?
    var updated_at: String?
    var expired_at: String?
    var state: String?
    
    
    var stateDescription: String?
    var active: String?
    var total_amount: String?
    var current_amount: String?
    var backer_count: String?
    var follow_count: String?
    var current_user_followed: Bool = false
    
    
    var share_count: String?
    var annualized_yield: String?
    var sell_ratio: String?
    var progress: String?
    var vip_period: String?
    var backer: Array<Any>?
    var verify: Bool = false
    var want: Array<Any>?
    var reward: [ZZWRewardModel]?

    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    override func mj_keyValuesDidFinishConvertingToObject() {
        self.reward = ZZWRewardModel.mj_objectArray(withKeyValuesArray: self.reward).copy() as? [ZZWRewardModel]
    }
    
}

