//
//  ZZWAcconut.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/5.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit


class ZZWAcconut: NSObject {

    var userName:String?
    var userPhone:String?
    

   override init() {
        super.init()
    }
    
//    MJCodingImplementation

//    //构造方法
//    required init(userName:String="", userPhone:String="") {
//        self.userName = userName
//        self.userPhone = userPhone
//    }
//    
//    //从object解析回来
//    required init(coder decoder: NSCoder) {
//        self.userName = decoder.decodeObject(forKey: "userName") as? String ?? ""
//        self.userPhone = decoder.decodeObject(forKey: "userPhone") as? String ?? ""
//    }
//    
//    //编码成object
//    func encode(with coder: NSCoder) {
//        coder.encode(userName, forKey:"userName")
//        coder.encode(userPhone, forKey:"userPhone")
//    }
    

}


