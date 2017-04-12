//
//  ZZWAccountTool.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/5.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit


class ZZWAccountTool: NSObject {
    var kFile = ((NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)).first)?.appending("account.data")
    
    var account:ZZWAcconut?

    //单例
    static let share = ZZWAccountTool()
    
    private override init(){
//        super.init()
        account = NSKeyedUnarchiver.unarchiveObject(withFile: kFile!) as! ZZWAcconut?
        
    }
    
    func saveAccount(account:ZZWAcconut)  {
        self.account = account
        
        NSKeyedArchiver.archiveRootObject(account, toFile: kFile!)
        
//        UserDefaults.standard.set(self.account?.userName, forKey: "usersAccount")
//        UserDefaults.standard.synchronize()
    }
    
    
    func ZZWIsLogin() -> Bool {
        if (ZZWAccountTool.share.account != nil) {
            return true
        }else{
            return false
        }
    }
    
    
    
    func logoutAccont() {
        ZZWAccountTool.share.account = nil
        let pathArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let shahePath = pathArray.first;
        let defaultManager = FileManager.default
        var tmpList:[String] = []
        do {
           try tmpList = FileManager.default.contentsOfDirectory(atPath: shahePath!)
        } catch{
        }
        for filename in tmpList {
            print("沙盒文件 " + filename);
            if (!(filename.range(of: "account.data")?.isEmpty)!) {
              let fullpath = shahePath?.appending(filename)
                if defaultManager.isDeletableFile(atPath: fullpath!) {
                    do {
                        try defaultManager.removeItem(atPath: fullpath!)
                    } catch  {
                        
                    }
                }
            }
        }
        
    }
            
}
