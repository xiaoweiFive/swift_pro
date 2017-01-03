//
//  UIView+Extension.swift
//  english_Demo_swift
//
//  Created by zhangzhenwei on 17/1/3.
//  Copyright © 2017年 zhangzhenwei. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 获取或设置 x
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// 获取或设置 y
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /// 获取或设置 width
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /// 获取或设置 height
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    /// 获取或设置 size
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    /// 获取或设置 origin
    public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
}

}
