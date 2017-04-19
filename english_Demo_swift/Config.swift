//
//  Config.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit



let KShareSDKAppKey = "1c19bdf5d172b"
let KShareSDKAppSecret = "ac05452377fcd002cda908c4c5d780cd"




let kFileAccount =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending("account.data")



let SCREEN_BOUNDS = UIScreen.main.bounds
let SCREEN_WIDTH = SCREEN_BOUNDS.width
let SCREEN_HEIGHT = SCREEN_BOUNDS.height


/// 导航栏背景色 - 绿色
let COLOR_NAV_BG = UIColor.colorWithHexString("41ca61")
/// 所有控制器背景颜色 - 偏白
let COLOR_ALL_BG = UIColor.colorWithHexString("f7f7f7")
/// 导航栏ITEM默认 - 白色
let COLOR_NAV_ITEM_NORMAL = UIColor(red:0.95, green:0.98, blue:1.00, alpha:1.00)

let RATE = SCREEN_WIDTH/375.0

let ZZWGrayColor = UIColor.init(r: 245, g: 246, b: 247)
let QSCTextColor = UIColor.init(r: 67, g: 172, b: 67)

func zzwColor(red: Int, green: Int, blue: Int, alpha: CGFloat) -> (UIColor){
    return UIColor(red: CGFloat(red)/CGFloat(255), green: CGFloat(green)/CGFloat(255), blue: CGFloat(blue)/CGFloat(255), alpha: alpha)
}

//let headSegmentArray = ["推荐","最新","热门","礼物","美食","生活","设计感","家居","数码","阅读","学生党","上班族","美妆","护理","运动户外","健康"]
