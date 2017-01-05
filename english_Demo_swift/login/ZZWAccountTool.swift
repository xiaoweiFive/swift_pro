//
//  ZZWAccountTool.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/5.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit


class ZZWAccountTool: NSObject {
    
    
    var account:ZZWAcconut?

    //单例
    static let share = ZZWAccountTool()
    private override init(){
//        super.init()
        
    }
    
    func saveAccount(account:ZZWAcconut)  {
        self.account = account
        UserDefaults.standard.set(self.account?.userName, forKey: "usersAccount")
        UserDefaults.standard.synchronize()
    }
    
    
    func ZZWIsLogin() -> Bool {
        if (ZZWAccountTool.share.account != nil) {
            return true
        }else{
            return false
        }
    }
            
}
