//
//  Config.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

let SCREEN_BOUNDS = UIScreen.main.bounds
let SCREEN_WIDTH = SCREEN_BOUNDS.width
let SCREEN_HEIGHT = SCREEN_BOUNDS.height


/// 导航栏背景色 - 绿色
let COLOR_NAV_BG = UIColor.colorWithHexString("41ca61")
/// 所有控制器背景颜色 - 偏白
let COLOR_ALL_BG = UIColor.colorWithHexString("f7f7f7")
/// 导航栏ITEM默认 - 白色
let COLOR_NAV_ITEM_NORMAL = UIColor(red:0.95, green:0.98, blue:1.00, alpha:1.00)



func zzwColor(red: Int, green: Int, blue: Int, alpha: CGFloat) -> (UIColor){
    return UIColor(red: CGFloat(red)/CGFloat(255), green: CGFloat(green)/CGFloat(255), blue: CGFloat(blue)/CGFloat(255), alpha: alpha)
}
//func zzwColorA()->UIColor{
//    return zzwColor()
//}