//
//  userInfo.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/5.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

class userInfo: NSObject,NSCoding {
    
    var name:String
    var phone:String
    
    init(name:String = "",phone:String = "") {
        self.name = name;
        self.phone = phone;
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(phone, forKey: "phone")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.phone = aDecoder.decodeObject(forKey: "phone") as? String ?? ""
    }
    
}
